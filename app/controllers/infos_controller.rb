class InfosController < ApplicationController

  #Allow infos to be viewed before email confirmation
  skip_before_action :cannot_access_without_confirmation

  def about
    @selected_tribe_navi_tab = "about"
    @selected_left_navi_link = "about"
  end

  def how_to_use
    redirect_to 'https://lifestyleandjoy.com', :status => :moved_permanently and return
    @selected_tribe_navi_tab = "about"
    @selected_left_navi_link = "how_to_use"
    content = if @community_customization && !@community_customization.how_to_use_page_content.nil?
      @community_customization.how_to_use_page_content.html_safe
    else
      MarketplaceService.how_to_use_page_default_content(I18n.locale, @current_community.name(I18n.locale))
    end
    render locals: { how_to_use_content: content }
  end

  def terms
    redirect_to 'https://lifestyleandjoy.com/privacy-policy/', :status => :moved_permanently and return
    @selected_tribe_navi_tab = "about"
    @selected_left_navi_link = "terms"
  end

  def privacy
    redirect_to 'https://lifestyleandjoy.com/privacy-policy/', :status => :moved_permanently and return
    @selected_tribe_navi_tab = "about"
    @selected_left_navi_link = "privacy"
  end

  def cookie_policy
    redirect_to 'https://lifestyleandjoy.com/cookie-policy/', :status => :moved_permanently and return
    @selected_tribe_navi_tab = "about"
    @selected_left_navi_link = "cookie_policy"
  end

  def cookies
    redirect_to 'https://lifestyleandjoy.com/cookie-policy/', :status => :moved_permanently and return
    @selected_tribe_navi_tab = "about"
    @selected_left_navi_link = "cookies"
  end

  def code_of_conduct
    redirect_to 'https://lifestyleandjoy.com/privacy-policy/', :status => :moved_permanently and return
    @selected_tribe_navi_tab = "about"
    @selected_left_navi_link = "code_of_conduct"
  end

  private

  def how_to_use_content?
    Maybe(@community_customization).map { |customization| !customization.how_to_use_page_content.nil? }
  end
end
