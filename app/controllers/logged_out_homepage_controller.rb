class LoggedOutHomepageController < ApplicationController

    def index
        # just show the index
        render locals: {
        }
    end

end
