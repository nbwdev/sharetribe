class CheatSheetController < ApplicationController

    def wardrobe_challenge_email
        #so I can test this at http://localhost:5000/cheat_sheet/wardrobe_challenge_email
        Delayed::Job.enqueue(CheatSheetWardrobeChallengeJob.new(@current_user.id, @current_community.id))
        flash[:notice] = t("emails.cheat_sheet.check_email")
        redirect_to search_path
    end

    def wardrobe_challenge_download
        send_file(
            "#{Rails.root}/public/guides/wardrobe-challenge.pdf",
            filename: "wardrobe-challenge.pdf",
            type: "application/pdf"
          ) 
    end
end
