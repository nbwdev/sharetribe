class Admin::MuteContactsService
  attr_reader :community, :params, :min_option_count, :custom_field

  def initialize(community:, params:)
    @params = params
    @community = community
  end

  def muted_contacts
    MutedContact.order('email_address')
  end

  def increment_mail_count(email)
    contact = MutedContact.find_by(email_address: email)
    contact.emails_blocked += 1
    contact.save
  end

  def unmute
    contact = MutedContact.find(params[:id])
    contact.destroy
  end

  def delete_muted_email
    unmute
  end

  def create
    contact = MutedContact.new
    contact.email_address = params[:email_address]
    contact.emails_blocked = 0
    contact.save!
  end

  def is_muted?(email)
    MutedContact.exists?(email_address: email)
  end

end

