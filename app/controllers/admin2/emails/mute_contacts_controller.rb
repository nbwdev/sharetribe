module Admin2::Emails
  class MuteContactsController < Admin2::AdminBaseController
    before_action :set_service

    def index; end

    def mute_contact_email
      create
    end

    def create
      success = @service.create
      #propagate the specific error from DB instead of masking it, as it's the admin page
      #raise I18n.t('admin2.notifications.mute_contact_create_failed') unless success

      flash[:notice] = t('admin2.notifications.muted_email_address')
    rescue StandardError => e
      flash[:error] = e.message
    ensure
      redirect_to admin2_emails_mute_contacts_path
    end

    def delete
      @service.unmute
      flash[:notice] = t('admin2.notifications.unmuted_email_address')
    rescue StandardError => e
      flash[:error] = e.message
    ensure
      redirect_to admin2_emails_mute_contacts_path
    end

    def update_email_count; end

    def update_newsletter
      @current_community.update!(newsletters_params)
      render json: { message: t('admin2.notifications.newsletters_updated') }
    rescue StandardError => e
      render json: { message: e.message }, status: :unprocessable_entity
    end

    private

    def set_service
      @service = Admin::MuteContactsService.new(
        community: @current_community,
        params: params)
    end

  end
end
