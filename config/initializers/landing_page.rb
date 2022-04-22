module CustomLandingPage
  # rubocop:disable Metrics/ModuleLength
  module StaticData

    # TODO Document the expected JSON structure here

    DATA_STR = <<JSON
{
  "settings": {
    "marketplace_id": 9999,
    "locale": "en",
    "sitename": "example"
  },

  "page": {
    "twitter_handle": {"type": "marketplace_data", "id": "twitter_handle"},
    "twitter_image": {"type": "assets", "id": "default_hero_background"},
    "facebook_image": {"type": "assets", "id": "default_hero_background"},
    "title": {"type": "marketplace_data", "id": "page_title"},
    "description": {"type": "marketplace_data", "id": "description"},
    "publisher": {"type": "marketplace_data", "id": "name"},
    "copyright": {"type": "marketplace_data", "id": "name"},
    "facebook_site_name": {"type": "marketplace_data", "id": "name"},
    "google_site_verification": {"value": "CHANGEME"}
  },

  "sections": [
    {
        "id": "intro_with_images",
        "kind": "locations",
        "title": "Welcome to  \\nneverbeenworn.co.uk",
        "paragraph": "Do you have clothes in your wardrobe that have never been worn?  \\n\\nAre they taking up too much space?",
        "location_color_hover": {"type": "marketplace_data", "id": "primary_color"},
        "button_color": {"type": "marketplace_data", "id": "primary_color"},
        "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
        "button_title": "Join us for free",
        "button_path": {"type": "path", "id": "signup"},
        "background_image_variation": "dark",
        "locations": [
            {
                "location": { "type": "path", "id": "signup" },
                "background_image": {"type": "assets", "id": "choosing-clothes-pink"}
            },
            {
                "location": { "type": "path", "id": "signup" },
                "background_image": {"type": "assets", "id": "choosing-clothes-sunny-window"}
            },
            {
                "location": { "type": "path", "id": "signup" },
                "background_image": {"type": "assets", "id": "choosing-clothes-stripy-top"}
            }
        ]
    },
    {
      "id": "intro_cta",
      "kind": "info",
      "variation": "single_column",
      "paragraph": "Now you can re-sell them at neverbeenworn.co.uk  \\n\\nStart clearing out your wardrobe and get cash too!",
      "background_color": [255, 255, 255],
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "Join us for free",
      "button_path": {"type": "path", "id": "signup"}
    },
    {
      "id": "quick_guide_heading",
      "kind": "info",
      "variation": "single_column",
      "paragraph": "**Quick Guide**",
      "background_color": [247, 155, 177]
    },
    {
      "id": "quick_guide",
      "kind": "info",
      "variation": "multi_column",
      "title": "It's so simple...",
      "background_color": [247, 155, 177],
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "1",
          "icon": "mobile-phone-2",
          "paragraph": "list your item for free"
        },
        {
          "title": "2",
          "icon": "shipment-upload",
          "paragraph": "sell it and send it to its new home"
        },
        {
          "title": "3",
          "icon": "cash-payment-bag",
          "paragraph": "and you get cash!"
        }
      ]
    },
    {
      "id": "join_us",
      "kind": "info",
      "variation": "single_column",
      "title": "Join us",
      "background_color": [247, 155, 177],
      "paragraph": "Get started now!",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "Join us for free",
      "button_path": {"value": "/signup"}
    },
    {
        "id": "buyer_section_intro",
        "kind": "locations",
        "title": "Are you ready for a fresh new life in 2022?",
        "paragraph": "Is your wardrobe ready too?",
        "location_color_hover": {"type": "marketplace_data", "id": "primary_color"},
        "button_color": {"type": "marketplace_data", "id": "primary_color"},
        "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
        "button_title": "Join us",
        "button_path": {"type": "path", "id": "signup"},
        "background_image_variation": "dark",
        "locations": [
            {
                "location": { "type": "path", "id": "signup" },
                "background_image": {"type": "assets", "id": "choosing-clothes-pink"}
            },
            {
                "location": { "type": "path", "id": "signup" },
                "background_image": {"type": "assets", "id": "choosing-clothes-sunny-window"}
            },
            {
                "location": { "type": "path", "id": "signup" },
                "background_image": {"type": "assets", "id": "choosing-clothes-stripy-top"}
            }
        ]
    },
    {
      "id": "buyer_section_cta",
      "kind": "info",
      "variation": "single_column",
      "paragraph": "Start building the new you at neverbeenworn.co.uk  \\n\\nBring your wardrobe back to life",
      "background_color": [255, 255, 255],
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "Go shop",
      "button_path": {"type": "path", "id": "search"}
    },
    {
      "id": "become_influencer",
      "kind": "info",
      "variation": "single_column",
      "title": "Are you ready for a fresh new life in 2022?",
      "paragraph": "Is your wardrobe ready too?  \\n\\nBring your wardrobe back to life with the help of neverbeenworn.co.uk",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "Find something new",
      "button_path": {"type": "path", "id": "search"}
    },
    {
      "id": "further_reading",
      "kind": "info",
      "variation": "multi_column",
      "title": "Things you might like to read...",
      "background_color": [247, 155, 177],
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "About",
          "icon": "book-view",
          "paragraph": "Building a community",
          "button_title": "About",
          "button_path": {"type": "path", "id": "about"}
        },
        {
          "title": "How it works",
          "icon": "pencil-write",
          "paragraph": "Simple and quick how-to guides",
          "button_title": "How it works",
          "button_path": {"value": "/en/infos/how_to_use"}
        },
        {
          "title": "Code of conduct",
          "icon": "heart-favorite",
          "paragraph": "Being good to each other",
          "button_title": "Code of conduct",
          "button_path": {"value": "en/infos/code_of_conduct"}
        }
      ]
    },
    {
      "id": "tagline",
      "kind": "info",
      "variation": "single_column",
      "paragraph": "**Helping the planet by reselling your fashion**",
      "background_color": [82, 89, 97]
    },
    {
      "id": "footer",
      "kind": "footer",
      "theme": "dark",
      "social_media_icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "social_media_icon_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "links": [
        {"label": "About", "href": {"type": "path", "id": "about"}},
        {"label": "Contact us", "href": {"type": "path", "id": "contact_us"}},
        {"label": "How it works", "href": {"type": "path", "id": "how_to_use"}},
        {"label": "Terms", "href": {"type": "path", "id": "terms"}},
        {"label": "Privacy", "href": {"type": "path", "id": "privacy"}},
        {"label": "Influencer club", "href": {"type": "path", "id": "new_invitation"}},
        {"label": "Shop", "href": {"value": "/s"}}
      ],
      "social": [
        {"service": "facebook", "url": "https://www.facebook.com/neverbeenworn/"},
        {"service": "twitter", "url": "https://twitter.com/never_been_worn"},
        {"service": "instagram", "url": "https://www.instagram.com/neverbeenworn"},
        {"service": "pinterest", "url": "https://www.pinterest.com/neverbeenworn"}
      ],
      "copyright": "Copyright neverbeenworn 2022"
    },
    {
      "id": "intentionally_blank",
      "kind": "info",
      "variation": "single_column",
      "title": "Template sections",
      "background-color": [255, 255, 255]
    },
    {
      "id": "hero",
      "kind": "hero",
      "variation": {"type": "marketplace_data", "id": "search_type"},
      "title": {"type": "marketplace_data", "id": "slogan"},
      "subtitle": {"type": "marketplace_data", "id": "description"},
      "background_image": {"type": "assets", "id": "default_hero_background"},
      "background_image_variation": "dark",
      "search_button": {"type": "translation", "id": "search_button"},
      "search_path": {"type": "path", "id": "search"},
      "search_placeholder": {"type": "marketplace_data", "id": "search_placeholder"},
      "search_location_with_keyword_placeholder": {"type": "marketplace_data", "id": "search_location_with_keyword_placeholder"},
      "signup_path": {"type": "path", "id": "signup"},
      "signup_button": {"type": "translation", "id": "signup_button"},
      "search_button_color": {"type": "marketplace_data", "id": "primary_color"},
      "search_button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "signup_button_color": {"type": "marketplace_data", "id": "primary_color"},
      "signup_button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"}
    },
    {
      "id": "video",
      "kind": "video",
      "variation": "youtube",
      "youtube_video_id": "UffchBUUIoI",
      "width": "1280",
      "height": "720",
      "text": "Video section can contain one Youtube video. Click to watch!"
    },
    {
      "id": "single_info_without_background_and_cta",
      "kind": "info",
      "variation": "single_column",
      "title": "Single column info section without background image and call to action button",
      "paragraph": "This is a single column info section without background image and call to action button."
    },
    {
      "id": "markdown_support",
      "kind": "info",
      "variation": "single_column",
      "title": "Limited Markdown support",
      "paragraph": "Text paragraphs can contain Markdown markup. Limited subset of Markdown syntax blocks are allowed. Allowed blocks are *italic*, **bold**, ***bold+italic***, ~~strike through~~, _underline_ and [links](https://www.sharetribe.com).  \\nLine breaks and...\\n\\n...new paragraphs are also supported"
    },
    {
      "id": "single_info_without_cta",
      "kind": "info",
      "variation": "single_column",
      "title": "Single column info section without call to action button",
      "paragraph": "This is a single column info section without background image and call to action button.",
      "background_image": {"type": "assets", "id": "default_hero_background"}
    },
    {
      "id": "single_info_with_background_and_cta",
      "kind": "info",
      "variation": "single_column",
      "title": "Single column info section with background image and call to action button",
      "paragraph": "This is a single column info section with background image and call to action button.",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "Go to sharetribe.com",
      "button_path": {"value": "https://www.sharetribe.com"},
      "background_image": {"type": "assets", "id": "default_hero_background"},
      "background_image_variation": "dark"
    },
    {
      "id": "single_info_with_cta",
      "kind": "info",
      "variation": "single_column",
      "title": "Single column info section with call to action button",
      "paragraph": "This is a single column info section with call to action button.",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "Contact us",
      "button_path": {"type": "path", "id": "contact_us"}
    },
    {
      "id": "single_info_with_background_color_and_cta",
      "kind": "info",
      "variation": "single_column",
      "title": "Single column info section with background color and call to action button",
      "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec ullamcorper nulla non metus auctor fringilla. Curabitur blandit tempus porttitor. Nulla vitae elit libero.",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "About",
      "button_path": {"type": "path", "id" :"about"},
      "background_color": [166, 76, 94]
    },
    {
      "id": "two_column_info_with_icons_and_buttons",
      "kind": "info",
      "variation": "multi_column",
      "title": "Two column info section with icons and buttons",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "icon": "grape",
          "title": "Column 1",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel.\\n\\nParagraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel.",
          "button_title": "Go to sharetribe.com",
          "button_path": {"value": "https://www.sharetribe.com"}
        },
        {
          "icon": "watering-can",
          "title": "Column 2",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel.",
          "button_title": "Go to sharetribe.com",
          "button_path": {"value": "https://www.sharetribe.com"}
        }
      ]
    },
    {
      "id": "two_column_info_without_icons_and_buttons",
      "kind": "info",
      "variation": "multi_column",
      "title": "Two column info section without icons and buttons",
      "columns": [
        {
          "title": "Column 1",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel.\\n\\nParagraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        },
        {
          "title": "Column 2",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        }
      ]
    },
    {
      "id": "three_column_info_with_icons_and_buttons",
      "kind": "info",
      "variation": "multi_column",
      "title": "Three column info with icons and buttons",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "Column 1",
          "icon": "quill",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel.",
          "button_title": "Go to sharetribe.com",
          "button_path": {"value": "https://www.sharetribe.com"}
        },
        {
          "title": "Column 2",
          "icon": "piggy-bank",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel.",
          "button_title": "Go to sharetribe.com",
          "button_path": {"value": "https://www.sharetribe.com"}
        },
        {
          "title": "Column 3",
          "icon": "globe-1",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel.",
          "button_title": "Go to sharetribe.com",
          "button_path": {"value": "https://www.sharetribe.com"}
        }
      ]
    },
    {
      "id": "three_column_info_without_icons_and_buttons",
      "kind": "info",
      "variation": "multi_column",
      "title": "Three column info without icons and buttons",
      "columns": [
        {
          "title": "Column 1",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        },
        {
          "title": "Column 2",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        },
        {
          "title": "Column 3",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        }
      ]
    },
    {
      "id": "two_column_info_without_icons_and_buttons_with_sigle_button",
      "kind": "info",
      "variation": "multi_column",
      "title": "Two column info section without icons and buttons",
      "columns": [
        {
          "title": "Column 1",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel.\\n\\nParagraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        },
        {
          "title": "Column 2",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        }
      ],
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "Contact us",
      "button_path": {"type": "path", "id": "contact_us"}
    },
    {
      "id": "three_column_info_without_icons_and_buttons_with_sigle_button",
      "kind": "info",
      "variation": "multi_column",
      "title": "Three column info without icons and buttons",
      "columns": [
        {
          "title": "Column 1",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        },
        {
          "title": "Column 2",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        },
        {
          "title": "Column 3",
          "paragraph": "Paragraph. Curabitur blandit tempus porttitor. Nulla vitae elit libero, a pharetra augue. Vivamus sagittis lacus vel."
        }
      ],
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "button_title": "Contact us",
      "button_path": {"type": "path", "id": "contact_us"}
    },
    {
        "id": "categories",
        "kind": "categories",
        "title": "Categories section",
        "paragraph": "PLEASE NOTE: This section is NOT ENABLED by default. To enable this section, replace category IDs with real IDs and add the section to the 'composition'. Categories section can contain 3 to 7 featured categories. Each category should have a background image.",
        "button_color": {"type": "marketplace_data", "id": "primary_color"},
        "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
        "button_title": "All categories",
        "button_path": {"type": "path", "id": "all_categories"},
        "category_color_hover": {"type": "marketplace_data", "id": "primary_color"},
      "categories": [
            {
                "category": { "type": "category", "id": 2 },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            },
            {
                "category": { "type": "category", "id": 2 },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            },
            {
                "category": { "type": "category", "id": 2 },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            },
            {
                "category": { "type": "category", "id": 2 },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            },
            {
                "category": { "type": "category", "id": 2 },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            },
            {
                "category": { "type": "category", "id": 3 },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            },
            {
                "category": { "type": "category", "id": 5 },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            }
        ]
    },
    {
        "id": "listings",
        "kind": "listings",
        "title": "Featured listings section",
        "paragraph": "PLEASE NOTE: This section is NOT ENABLED by default. To enable this section, replace listing IDs with real IDs and add the section to the 'composition'. This section contains 3 featured listings",
        "button_color": {"type": "marketplace_data", "id": "primary_color"},
        "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
        "button_title": "Browse all listings",
        "button_path": {"type": "path", "id": "search"},
        "price_color": {"type": "marketplace_data", "id": "primary_color"},
        "no_listing_image_background_color": {"type": "marketplace_data", "id": "primary_color"},
        "no_listing_image_text": {"type": "translation", "id": "no_listing_image"},
        "author_name_color_hover": {"type": "marketplace_data", "id": "primary_color"},
        "listings": [
            {
                "listing": { "type": "listing", "id": 33 }
            },
            {
                "listing": { "type": "listing", "id": 24 }
            },
            {
                "listing": { "type": "listing", "id": 17 }
            }
        ]
    },
    {
        "id": "locations",
        "kind": "locations",
        "title": "Locations section",
        "paragraph": "PLEASE NOTE: This section is NOT ENABLED by default. To enable this section add the section to the 'composition'. Locations section can contain 3 to 7 featured locations. Each location should have a background image.",
        "location_color_hover": {"type": "marketplace_data", "id": "primary_color"},
        "button_color": {"type": "marketplace_data", "id": "primary_color"},
        "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
        "button_title": "Browse all listings",
        "button_path": {"type": "path", "id": "search"},
        "locations": [
            {
                "title": "About",
                "location": { "type": "path", "id": "about" },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            },
            {
                "title": "Contact Us",
                "location": { "type": "path", "id": "contact_us" },
                "background_image": {"type": "assets", "id": "default_hero_background"}
            },
            {
                "location": "https://bagshare.wordpress.com/",
                "background_image": {"type": "assets", "id": "default_hero_background"}
            }
        ]
    },
    {
      "id": "footer_original",
      "kind": "footer",
      "theme": "dark",
      "social_media_icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "social_media_icon_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "links": [
        {"label": "About", "href": {"type": "path", "id": "about"}},
        {"label": "Contact us", "href": {"type": "path", "id": "contact_us"}},
        {"label": "How to use?", "href": {"type": "path", "id": "how_to_use"}},
        {"label": "Terms", "href": {"type": "path", "id": "terms"}},
        {"label": "Privary", "href": {"type": "path", "id": "privacy"}},
        {"label": "Invite new members", "href": {"type": "path", "id": "new_invitation"}},
        {"label": "Sharetribe", "href": {"value": "https://www.sharetribe.com"}}
      ],
      "social": [
        {"service": "facebook", "url": "https://www.facebook.com/Sharetribe/"},
        {"service": "twitter", "url": "https://twitter.com/sharetribe"},
        {"service": "instagram", "url": "https://www.instagram.com/"},
        {"service": "youtube", "url": "https://www.youtube.com/channel/UCtefWVq2uu4pHXaIsHlBFnw"},
        {"service": "googleplus", "url": "https://plus.google.com/114869130265262677354/"},
        {"service": "linkedin", "url": "https://www.linkedin.com/company/2626583"},
        {"service": "pinterest", "url": "https://www.pinterest.com/"},
        {"service": "soundcloud", "url": "https://soundcloud.com/"}
      ],
      "copyright": "Copyright Marketplace Ltd 2016"
    },
    {
      "id": "icons_test_1",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "book-view",
          "icon": "book-view"
        },
        {
          "title": "calendar-favorite-heart-1",
          "icon": "calendar-favorite-heart-1"
        },
        {
          "title": "calendar-heart-1",
          "icon": "calendar-heart-1"
        }
      ]
    },
    {
      "id": "icons_test_2",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "camera-1",
          "icon": "camera-1"
        },
        {
          "title": "camera-1-light",
          "icon": "camera-1-light"
        },
        {
          "title": "camera-2",
          "icon": "camera-2"
        }
      ]
    },
    {
      "id": "icons_test_3",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "camera-flash",
          "icon": "camera-flash"
        },
        {
          "title": "camera-lens-1",
          "icon": "camera-lens-1"
        },
        {
          "title": "camera-user",
          "icon": "camera-user"
        }
      ]
    },
    {
      "id": "icons_test_4",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "canoe",
          "icon": "canoe"
        },
        {
          "title": "cash-bulb",
          "icon": "cash-bulb"
        },
        {
          "title": "cash-idea",
          "icon": "cash-idea"
        }
      ]
    },
    {
      "id": "icons_test_5",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "cash-payment-bag",
          "icon": "cash-payment-bag"
        },
        {
          "title": "cash-payment-bill-1",
          "icon": "cash-payment-bill-1"
        },
        {
          "title": "cash-payment-bill-2",
          "icon": "cash-payment-bill-2"
        }
      ]
    },
    {
      "id": "icons_test_6",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "cash-payment-bill-3",
          "icon": "cash-payment-bill-3"
        },
        {
          "title": "cash-payment-bill-4",
          "icon": "cash-payment-bill-4"
        },
        {
          "title": "cash-pin-map",
          "icon": "cash-pin-map"
        }
      ]
    },
    {
      "id": "icons_test_7",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "cash-protect",
          "icon": "cash-protect"
        },
        {
          "title": "champagne-cheers",
          "icon": "champagne-cheers"
        },
        {
          "title": "checklist-pen",
          "icon": "checklist-pen"
        }
      ]
    },
    {
      "id": "icons_test_8",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "clipboard-add",
          "icon": "clipboard-add"
        },
        {
          "title": "clipboard-check",
          "icon": "clipboard-check"
        },
        {
          "title": "coin-receive",
          "icon": "coin-receive"
        }
      ]
    },
    {
      "id": "icons_test_9",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "coins-receive",
          "icon": "coins-receive"
        },
        {
          "title": "coins-1",
          "icon": "coins-1"
        },
        {
          "title": "credit-card",
          "icon": "credit-card"
        }
      ]
    },
    {
      "id": "icons_test_10",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "credit-card-business",
          "icon": "credit-card-business"
        },
        {
          "title": "credit-card-check",
          "icon": "credit-card-check"
        },
        {
          "title": "credit-card-give",
          "icon": "credit-card-give"
        }
      ]
    },
    {
      "id": "icons_test_11",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "credit-card-hand",
          "icon": "credit-card-hand"
        },
        {
          "title": "credit-card-laptop",
          "icon": "credit-card-laptop"
        },
        {
          "title": "credit-card-lock",
          "icon": "credit-card-lock"
        }
      ]
    },
    {
      "id": "icons_test_12",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "credit-card-monitor-payment-regular",
          "icon": "credit-card-monitor-payment-regular"
        },
        {
          "title": "credit-card-scan",
          "icon": "credit-card-scan"
        },
        {
          "title": "ecology-globe-hand",
          "icon": "ecology-globe-hand"
        }
      ]
    },
    {
      "id": "icons_test_13",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "ecology-globe-house",
          "icon": "ecology-globe-house"
        },
        {
          "title": "ecology-human-mind",
          "icon": "ecology-human-mind"
        },
        {
          "title": "eiffel-tower",
          "icon": "eiffel-tower"
        }
      ]
    },
    {
      "id": "icons_test_14",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "farmer",
          "icon": "farmer"
        },
        {
          "title": "female",
          "icon": "female"
        },
        {
          "title": "file-checklist",
          "icon": "file-checklist"
        }
      ]
    },
    {
      "id": "icons_test_15",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "footwear-open-heels",
          "icon": "footwear-open-heels"
        },
        {
          "title": "heart-angel",
          "icon": "heart-angel"
        },
        {
          "title": "heart-balloons",
          "icon": "heart-balloons"
        }
      ]
    },
    {
      "id": "icons_test_16",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "heart-care",
          "icon": "heart-care"
        },
        {
          "title": "heart-edit",
          "icon": "heart-edit"
        },
        {
          "title": "heart-favorite",
          "icon": "heart-favorite"
        }
      ]
    },
    {
      "id": "icons_test_17",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "heart-protect",
          "icon": "heart-protect"
        },
        {
          "title": "heart-refresh",
          "icon": "heart-refresh"
        },
        {
          "title": "heart-search",
          "icon": "heart-search"
        }
      ]
    },
    {
      "id": "icons_test_18",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "heart-share",
          "icon": "heart-share"
        },
        {
          "title": "house-hand",
          "icon": "house-hand"
        },
        {
          "title": "list-to-do",
          "icon": "list-to-do"
        }
      ]
    },
    {
      "id": "icons_test_19",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "love-gift-diamond",
          "icon": "love-gift-diamond"
        },
        {
          "title": "mobile-phone-2",
          "icon": "mobile-phone-2"
        },
        {
          "title": "mobile-phone-check",
          "icon": "mobile-phone-check"
        }
      ]
    },
    {
      "id": "icons_test_20",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "mobile-phone-view-2",
          "icon": "mobile-phone-view-2"
        },
        {
          "title": "notebook-pencil",
          "icon": "notebook-pencil"
        },
        {
          "title": "pencil-write",
          "icon": "pencil-write"
        }
      ]
    },
    {
      "id": "icons_test_21",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "party-popper",
          "icon": "party-popper"
        },
        {
          "title": "primitive-symbols-group",
          "icon": "primitive-symbols-group"
        },
        {
          "title": "products-gifts",
          "icon": "products-gifts"
        }
      ]
    },
    {
      "id": "icons_test_22",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "shipment-deliver",
          "icon": "shipment-deliver"
        },
        {
          "title": "shipment-delivered",
          "icon": "shipment-delivered"
        },
        {
          "title": "shipment-give",
          "icon": "shipment-give"
        }
      ]
    },
    {
      "id": "icons_test_23",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "shipment-in-transit",
          "icon": "shipment-in-transit"
        },
        {
          "title": "shipment-upload",
          "icon": "shipment-upload"
        },
        {
          "title": "shop-like",
          "icon": "shop-like"
        }
      ]
    },
    {
      "id": "icons_test_24",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "sign-for-sale-2",
          "icon": "sign-for-sale-2"
        },
        {
          "title": "store",
          "icon": "store"
        },
        {
          "title": "store-open",
          "icon": "store-open"
        }
      ]
    },
    {
      "id": "icons_test_25",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "store-sale",
          "icon": "store-sale"
        },
        {
          "title": "taking-pictures-woman-1",
          "icon": "taking-pictures-woman-1"
        },
        {
          "title": "task-checklist",
          "icon": "task-checklist"
        }
      ]
    },
    {
      "id": "icons_test_26",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "task-list-pen",
          "icon": "task-list-pen"
        },
        {
          "title": "thumbs-up-1",
          "icon": "thumbs-up-2"
        },
        {
          "title": "typewriter-1",
          "icon": "typewriter-1"
        }
      ]
    },
    {
      "id": "icons_test_27",
      "kind": "info",
      "variation": "multi_column",
      "title": "",
      "button_color": {"type": "marketplace_data", "id": "primary_color"},
      "button_color_hover": {"type": "marketplace_data", "id": "primary_color_darken"},
      "icon_color": {"type": "marketplace_data", "id": "primary_color"},
      "columns": [
        {
          "title": "wine-sparkling-cheers",
          "icon": "wine-sparkling-cheers"
        },
        {
          "title": "vision-berkshiregoods",
          "icon": "vision-berkshiregoods"
        },
        {
          "title": "thumbs-up-2",
          "icon": "thumbs-up-2"
        }
      ]
    }
  ],

  "composition": [
    { "section": {"type": "sections", "id": "intro_with_images"}},
    { "section": {"type": "sections", "id": "intro_cta"}},
    { "section": {"type": "sections", "id": "quick_guide_heading"}},
    { "section": {"type": "sections", "id": "quick_guide"}},
    { "section": {"type": "sections", "id": "join_us"}},
    { "section": {"type": "sections", "id": "buyer_section_intro"}},
    { "section": {"type": "sections", "id": "buyer_section_cta"}},
    { "section": {"type": "sections", "id": "further_reading"}},
    { "section": {"type": "sections", "id": "tagline"}},
    { "section": {"type": "sections", "id": "footer"}}
  ],

  "assets": [
    { "id": "default_hero_background", "src": "default_hero_background.jpg", "content_type": "image/jpeg" },
    { "id": "choosing-clothes-pink", "src": "choosing-clothes-pink.jpg", "content_type": "image/jpeg" },
    { "id": "choosing-clothes-sunny-window", "src": "choosing-clothes-sunny-window.jpg", "content_type": "image/jpeg" },
    { "id": "choosing-clothes-stripy-top", "src": "choosing-clothes-stripy-top.jpg", "content_type": "image/jpeg" }
  ]
}
JSON


  end
  # rubocop:enable Metrics/ModuleLength
end
