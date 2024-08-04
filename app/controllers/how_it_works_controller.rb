class HowItWorksController < ApplicationController

    def index
        redirect_to 'https://lifestyleandjoy.com' and return

        # just show the index
        render locals: {
            is_logged_in: @current_user.present?,
            is_verified: @current_user.present? && !@current_user.community_membership.pending_consent?
        }
    end

end
