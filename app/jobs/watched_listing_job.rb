class WatchedListingJob < Struct.new(:listing_id, :community_id)
  # To inform a seller that someone wants to buy their item but cannot until they set up payments

  include DelayedAirbrakeNotification

  # This before hook should be included in all Jobs to make sure that the service_name is
  # correct as it's stored in the thread and the same thread handles many different communities
  # if the job doesn't have host parameter, should call the method with nil, to set the default service_name
  def before(job)
    # Set the correct service name to thread for I18n to pick it
    community = Community.find(community_id)
    ApplicationHelper.store_community_service_name_to_thread(community.name(community.default_locale))
  end

  def perform
    return if !listing || listing.closed? || !author

    if should_notify(author)
      MailCarrier.deliver_now(PersonMailer.new_watcher_of_unavailable_listing_notification(listing, author, community))
    end
  end

  def should_notify(author)
    author.should_receive?('email_when_someone_wants_to_buy')
  end

  def listing
    @listing ||= Listing.find_by_id(listing_id)
  end

  def author
    @author ||= listing.author
  end

  def community
    @community ||= Community.find_by_id(community_id)
  end
end
