module Admin2::Emails
  class NewsflashController < Admin2::AdminBaseController

    def index; end

    # Copy of the other action to be fixed
    def create
      
      # HACK obviously
      # image_url_base = "http://192.168.178.28:5000/"
      image_url_base = get_base_url("https://neverbeenworn.co.uk")

      content = params[:newsflash_mail]
      
      content[:hero_image_path] = get_hero_filename(content[:hero_image_id], image_url_base)
      content[:signature_path] = "https:" + image_path("my_story/rabena-signature.jpg")

      # articles: [ { url, thumbnail, alt_text, title, description['parag1','parag2'] } ]
      content[:articles] = [
        {
          # :url => image_url_base + article_path(:id => "top_5_fixes_for_autumn"),
          # :thumbnail => image_url_base + image_path("blog/top-5-fixes-for-autumn/red-jumper-shopping-thumb.jpg"),
          :url => "https://neverbeenworn.co.uk" + article_path(:id => "top_5_fixes_for_autumn"),
          :thumbnail => "https:" + image_path("blog/top-5-fixes-for-autumn/red-jumper-shopping-thumb.jpg"),
          :alt_text => "Top 5 Autumn Fixes cover - A woman wears a long red jumper accessorised with a black belt and carries a few bags from the high-end stores in the street behind her",
          :title => '5 top fixes for your autumn wardrobe',
          :description => ['How to get your autumn wardrobe ready in 5 simple steps','Look great with less effort']
        },
        {
          :id => "baggy_suit",
          :url => "https://neverbeenworn.co.uk" + article_path(:id => "baggy_suit"),
          :thumbnail => "https:" + image_path("blog/baggy-suit/baggy-suits-thumb.jpg"),
          :alt_text => "Baggy Suit cover - two women mean business in bold-coloured baggy suits",
          :title => "Baggy Suits – this season’s wardrobe must have",
          :description => ["An effortless essential for your new hybrid working from anywhere wardrobe"]
        },
        {
          :id => "big_boots_how_to_wear_them",
          :url => "https://neverbeenworn.co.uk" + article_path(:id => "big_boots_how_to_wear_them"),
          :thumbnail => "https:" + image_path("blog/big-boots/sitting-on-plinth-thumb.jpg"),
          :alt_text => "Big boots cover - sitting casually on the plinth of a column, wearing a mid-length brown coat, skinny ripped jeans and big black boots",
          :title => "Big boots are back this season",
          :description => ["How to buy the right ones for your wardrobe and your wallet"]
        },
        {
          :id => "white_shirts",
          :url => "https://neverbeenworn.co.uk" + article_path(:id => "white_shirts"),
          :thumbnail => "https:" + image_path("blog/white-shirts/white-shirt-on-stool-thumb.jpg"),
          :alt_text => "White shirts cover - sitting on a high stool wearing a balloon-sleeved white shirt and skinny brown trousers",
          :title => "White shirt chic",
          :description => ["A staple item for your effortless wardrobe and an essential for autumn"]
        },
      ]

      recipient_ids_t = ['aV1Rhj_iQ0TDYPfmWSTFnQ', # testrobt = rob
        'reGeLbQ-QPknfpHnmW9FqQ', # adminr = robblyth77
        '70F3NSDWE2XiqJR2sK0nxg'  # robf = robtestingfebfirst
      ]
      recipient_ids_p = ['2K5rJ3v03uaPvUP-dssx5A',
        '5ysED4xbdFfLHMtNF83inA',
        '7jorN-0kzggg173oQgsBdA',
        '9EkbnJ5ftE5ObJW65L7MUw',
        'cVC_v_HNO03Hxgpq1rfODw',
        'gWH-dqZv1KUwDvzl3YFDTg',
        'jGBRjxC7yaM4cgvx4691JA',
        'olfA-td0k061_-pKha1Stw',
        'Rk7o2QoW2SfnafPkATy25w',
        'RKHMuGULUdTbWtox89UxdA',
        'U49hF9MJYeQ2_YzNKYB0MQ',
        'UJFp_VasE_KstK_PBdkSWA',
        'uuahQgExCvuhBfIlPVy1qQ',
        'UWf7hdhqDEOddTATLG8WPQ',
        'wv-gG__RPC_MKHENSbWI6A',
        'yV93WKJfl4bUmq2Yv6kbfw',
        'ZJmULk4EmFEDxiUNfjEH-A',
        'zxMgEKJNh71ZbPme_iFTzw']

      recipient_ids = recipient_ids_p
      is_test = true #params[:test_email] == '1'
      if is_test
        # Delayed::Job.enqueue(NewsflashEmailSendJob.new(@current_user.id,
        #                                                      @current_user.id,
        #                                                      @current_community.id,
        #                                                      content,
        #                                                      params[:newsflash_mail][:locale], true))
        recipient_ids.each do |recipient|
          Delayed::Job.enqueue(NewsflashEmailSendJob.new(@current_user.id,
            recipient,
            @current_community.id,
            content,
            params[:newsflash_mail][:locale], true))
        end
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
    # rescue StandardError => e
    #   logger.error "Failed to send the newsflash: " + e.full_message
    #   logger.error e.backtrace.join("\n")
    #   render json: { message: e.message }, status: :unprocessable_entity
    end

    def create_hero_image
      hero = NewsflashHeroImage.new
      hero.newsflash_hero_image = params[:newsflash_hero_image][:hero_image]
      hero.alt_text = "Stylish woman in the park on a sunny autumn day. She wears a white knitted top under a long beige coat, with an oversized mahogany brown leather bag, tan leather belt, and semi-mirrored aviators"
      was_saved = hero.save

      if was_saved
        render json: { message: "successfully created image of id " + hero.id.to_s, id: hero.id, image_file_name: hero.newsflash_hero_image_file_name }
      else
        test_variable = "delaying matters"
        error_message = hero.errors.full_messages
  
        output_message = "failed to create the image #{hero.newsflash_hero_image_file_name} because of #{error_message}"
        render json: { message: output_message, id: hero.id, image_file_name: hero.newsflash_hero_image_file_name, errors: hero.errors.as_json(full_messages: true) }, status: :bad_request
      end
    end

    def get_hero_filename(id, base_url)
      hero = NewsflashHeroImage.find(id)
      path = base_url + "/system/newsflash_hero_images/" + id.to_s + "/original/" + hero.newsflash_hero_image_file_name
      path
    end

    #HACK ALERT because I have no default host configured locally to use image_url properly
    def get_base_url(default)
      case request.host
      when "localhost"
        "http://localhost:5000"
      when "192.168.178.28"
        "http://192.168.178.28:5000"
      else
        default
      end
    end

    def image_path(path)
      ActionController::Base.helpers.image_path(path)
    end
  end
end
