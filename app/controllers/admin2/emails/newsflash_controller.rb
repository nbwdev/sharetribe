module Admin2::Emails
  class NewsflashController < Admin2::AdminBaseController

    def index; end

    # Copy of the other action to be fixed
    def create
      # content = params[:newsflash_mail][:content].gsub(/[”“]/, '"')
      content = params[:newsflash_mail]

      is_test = true #params[:test_email] == '1'
      if is_test
        Delayed::Job.enqueue(NewsflashEmailSendJob.new(@current_user.id,
                                                             @current_user.id,
                                                             @current_community.id,
                                                             content,
                                                             params[:newsflash_mail][:locale], true))
        render json: { message: t('admin2.notifications.test_email_sent') }
      # else
      #   email_job = CreateMemberEmailBatchJob.new(@current_user.id,
      #                                             @current_community.id,
      #                                             content,
      #                                             params[:newsflash_mail][:locale],
      #                                             params[:newsflash_mail][:recipients])
      #   Delayed::Job.enqueue(email_job)
      #   render json: { message: t('admin2.notifications.email_sent') }
      end
    rescue StandardError => e
      logger.error "Failed to send the newsflash"
      logger.error e.backtrace.join("\n")
      render json: { message: e.message }, status: :unprocessable_entity
    end

    def create_hero_image
      hero = NewsflashHeroImage.new
      hero.newsflash_hero_image = params[:newsflash_hero_image][:hero_image]
      hero.alt_text = "HARDCODED alt text"
      hero.save

      render json: { message: "successfully created image of id " + hero.id.to_s, id: hero.id, image_file_name: hero.newsflash_hero_image_file_name }
      # @hero
      # if @hero.save
      #   redirect_to books_path
      # else
      #   render :new
      # end
    end
  end
end
