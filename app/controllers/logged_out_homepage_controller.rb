class LoggedOutHomepageController < ApplicationController

    def index

        redirect_to 'https://lifestyleandjoy.com' and return

        # just show the index
        render locals: {
        }
    end

end
