class LoggedOutHomepageController < ApplicationController

    def index

        redirect_to 'https://lifestyleandjoy.com', :status => :moved_permanently and return

        # just show the index
        render locals: {
        }
    end

end
