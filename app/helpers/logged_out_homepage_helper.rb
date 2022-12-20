module LoggedOutHomepageHelper

  module_function

  IMAGE_AND_TEXT = "IMAGE_AND_TEXT" # Image in left pane, paragraph of text in right pane
  TITLE_AND_TEXT = "TITLE_AND_TEXT" # Title in left pane, paragraph of text in right pane
  TITLE_AND_LIST = "TITLE_AND_LIST" # Title in left pane, bullet point list in right pane

  def get_carousel_cards()
    [
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "",
        :card_title => "5 minute wardrobe fix",
        :tip_list => [
            "Take a quick look at your wardrobe".html_safe,
            "Identify one clutter hot spot".html_safe,
            "Pick one thing you could fix in 5&nbsp;mins".html_safe,
            "Fix it".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "4 Top categories to help you declutter",
        :tip_list => [
            "Keep & wear".html_safe,
            "Recycle".html_safe,
            "Sell".html_safe,
            "Donate".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "4 Top clutter mistakes people make",
        :tip_list => [
            "Keeping it for when it fits".html_safe,
            "Keeping more than 1 spare".html_safe,
            "Keeping to repair one day".html_safe,
            "Keeping just in case".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "5 Top clothing categories to reduce your clutter",
        :tip_list => [
            "Wear every day".html_safe,
            "Winter".html_safe,
            "Spring/Autumn".html_safe,
            "Summer".html_safe,
            "Special occasions".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "4 Ruthless categories to reduce your winter accessories",
        :tip_list => [
            "Every day scarf".html_safe,
            "Every day hat and gloves".html_safe,
            "Special occasions scarf".html_safe,
            "Special occasions hat and gloves".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "How to identify your clutter in 4 quick steps",
        :tip_list => [
            "You wardrobe is completely full".html_safe,
            "You have extra stuff in other rooms".html_safe,
            "You have extra stuff in boxes".html_safe,
            "It’s always a mess".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "4 Top declutter questions to ask yourself",
        :tip_list => [
            "Do I wear it now?".html_safe,
            "Does it need repair?".html_safe,
            "Does it fit?".html_safe,
            "Is it in good condition?".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "Your wardrobe is no longer working for you when…",
        :tip_list => [
            "You can't find anything to wear".html_safe,
            "Nothing fits".html_safe,
            "You can’t find what you are looking for".html_safe,
            "It takes you a long time to get ready".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_TEXT,
        :item_class => "carousel-hide",
        :card_title => "Try this one new habit to reduce your fast fashion",
        :tip_text => "Everyday wear gets worn and washed regularly so it should be of good quality to stay looking good and last longer".html_safe
      },
      {
        :card_type => "IMAGE_AND_TEXT",
        :item_class => "carousel-hide",
        :image_path => "logged_out_homepage/upgrade-with-an-elegant-scarf.jpg",
        :alt_text => "A woman stands under the arched walkway on a European street. She wears a fresh pastel pink long wool coat with a paisley scarf. She is looking intently into the window of a nearby store.",
        :tip_title => "Autumn Tips",
        :tip_text => "Is your outfit feeling<br>a bit casual?<br>Add an elegant scarf<br>for an instant upgrade".html_safe
      }
    ]
  end
end
