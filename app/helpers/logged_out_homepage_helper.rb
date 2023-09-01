module LoggedOutHomepageHelper

  module_function

  IMAGE_AND_TEXT = "IMAGE_AND_TEXT" # Image in left pane, paragraph of text in right pane
  TITLE_AND_TEXT = "TITLE_AND_TEXT" # Title in left pane, paragraph of text in right pane
  TITLE_AND_LIST = "TITLE_AND_LIST" # Title in left pane, bullet point list in right pane
  ARTICLE_LINK = "ARTICLE_LINK" # Pinterest-style title card for an article

  ORANGE = "orange"
  PURPLE = "purple"

  # new version of the carousel with article links
  # tidy up one or the other list when happy
  def get_carousel_article_cards()
    [
      {
        :card_type => ARTICLE_LINK,
        :item_class => "", # don't hide the first one
        :card_title => "Find your perfect hat for the perfect summer",
        :card_image => "blog/summer-hat-for-style/white-sun-hat.jpg",
        :alt_text => "A stylish woman stands near a swimming pool wearing a white sun hat with a black ribbon and a pale yellow summer halter top",
        :article_id => "summer_hat_for_style",
        :button_cta => "READ MORE",
        :card_text => "",
        :colour => PURPLE
      },
      {
        :card_type => ARTICLE_LINK,
        :item_class => "carousel-hide",
        :card_title => "White trainers: why they are still great for summer and your wallet",
        :card_image => "blog/white-trainers/white-trainers-tying-laces.jpg",
        :alt_text => "A happy woman in a white hoodie, black leggings, and white trainers ties her shoe lace.",
        :article_id => "white_trainers",
        :button_cta => "READ MORE",
        :card_text => "",
        :colour => ORANGE
      },
      {
        :card_type => ARTICLE_LINK,
        :item_class => "carousel-hide",
        :card_title => "Which hats give the best sun protection",
        :card_image => "blog/summer-hat-for-protection/bucket-hat-square.jpg",
        :alt_text => "A woman wearing a bucket hat to protect herself from the sun, along with an aztec-patterned summer shirt over a white vest top, looks pensively into the middle distance.",
        :article_id => "summer_hat_for_protection",
        :button_cta => "READ MORE",
        :card_text => "",
        :colour => PURPLE
      },
      {
        :card_type => ARTICLE_LINK,
        :item_class => "carousel-hide",
        :card_title => "Beach bag essentials for a hassle free day at the beach",
        :card_image => "blog/summer-beach-bag/summer-beach-bag.jpg",
        :alt_text => "A woven straw beach bag with some essential items poking out of it - sun screen, sunglasses, camera, and notebook.",
        :article_id => "summer_beach_bag",
        :button_cta => "READ MORE",
        :card_text => "",
        :colour => ORANGE
      },
    ]
  end

  # the old version of the carousel with the tips
  def get_carousel_cards()
    [
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "Top 4 questions to help you declutter",
        :tip_list => [
            "Do I wear it now?".html_safe,
            "Will I repair it?".html_safe,
            "Does it fit?".html_safe,
            "Is it in good condition?".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "4 quick questions to confirm you have clutter",
        :tip_list => [
            "Is your wardrobe full?".html_safe,
            "Is it hard to find things?".html_safe,
            "Is it hard to put things in?".html_safe,
            "Is it always in a mess?".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "Top 4 clutter mistakes people make",
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
        :card_title => "Your wardrobe is no longer your friend&nbsp;if…".html_safe,
        :tip_list => [
            "You have nothing to wear".html_safe,
            "Most things don’t fit".html_safe,
            "You can’t find anything".html_safe,
            "You hate getting ready".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "Top 5 clothing categories to reorganise your wardrobe",
        :tip_list => [
            "Wear every day".html_safe,
            "Winter wear".html_safe,
            "Spring/Autumn".html_safe,
            "Summer wear".html_safe,
            "Special occasions".html_safe
        ]
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "carousel-hide",
        :card_title => "4 basic needs for your winter accessories",
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
        :card_title => "Top 4 categories to help you declutter",
        :tip_list => [
            "Keep it & wear it".html_safe,
            "Re-sell it".html_safe,
            "Donate it".html_safe,
            "Recycle it".html_safe
        ],
        :font_size_bigger => "20px"
      },
      {
        :card_type => TITLE_AND_TEXT,
        :item_class => "carousel-hide",
        :card_title => "Try this one new habit to reduce your fast fashion",
        :tip_text => "Everyday items get worn and washed more often. Buying better quality, when you are ready to replace them, will mean they last longer and support you for longer".html_safe
      },
      {
        :card_type => TITLE_AND_LIST,
        :item_class => "",
        :card_title => "5 minute wardrobe fix",
        :tip_list => [
            "Go look in your wardrobe".html_safe,
            "Find a clutter hot spot".html_safe,
            "Pick one thing to fix".html_safe,
            "Fix it in less than 5&nbsp;mins".html_safe
        ]
      }
    ]
  end
end
