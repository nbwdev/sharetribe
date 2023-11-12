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
        :card_title => "How to buy a winter jumper that will last until spring",
        :card_image => "blog/winter-jumpers/red-jumper-square.jpg",
        :alt_text => "A lady relaxes on a low stool in a dark red jumper.",
        :article_id => "winter_jumpers",
        :button_cta => "READ MORE",
        :card_text => "",
        :colour => PURPLE
      },
      {
        :card_type => ARTICLE_LINK,
        :item_class => "carousel-hide",
        :card_title => "Top 5 cheats - for the perfect get you through winter scarf",
        :card_image => "blog/winter-scarves/pale-pink-matching-knits-square.jpg",
        :alt_text => "A lady smiles in her chunky soft cable-knit jumper, scarf and hat combo.",
        :article_id => "winter_scarves",
        :button_cta => "READ MORE",
        :card_text => "",
        :colour => ORANGE
      },
      {
        :card_type => ARTICLE_LINK,
        :item_class => "carousel-hide",
        :card_title => "Buying a padded winter jacket - how to avoid spending to much",
        :card_image => "blog/padded-jackets/grey-padded-jacket-high-street-square.jpg",
        :alt_text => "A lady on a snowy shopping street wearing a long grey padded jacket, below-knee tan leather boots and a warm wollen hat matching the jacket.",
        :article_id => "padded_jackets",
        :button_cta => "READ MORE",
        :card_text => "",
        :colour => PURPLE
      },
      {
        :card_type => ARTICLE_LINK,
        :item_class => "carousel-hide",
        :card_title => "I went from hoarding 18 scruffy scarves to only needing four elegant ones",
        :card_image => "blog/too-many-scarves/scarves-organised.jpg",
        :alt_text => "Three cozy and soft woolen scarves in a pile.",
        :article_id => "too_many_scarves",
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
