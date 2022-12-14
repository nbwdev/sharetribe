class CheatSheetWardrobeChallengeJob < Struct.new(:recipient_id, :community_id)
  # When a customer has asked us to email the wardrobe challenge booklet to them

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
    return if !recipient

    if should_notify(recipient)
      MailCarrier.deliver_now(PersonMailer.cheat_sheet(recipient, community))
    end
  end

  def should_notify(recipient)
    # they explicitly asked for this so always send it
    true
  end

  def recipient
    @recipient ||= Person.find(recipient_id)
  end

  def community
    @community ||= Community.find_by_id(community_id)
  end
end
