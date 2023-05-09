class BlogController < ApplicationController

    ARTICLES = 
    {
        # :related - You can have up to 6 related articles, they will show in og:see_also which hopefully hints Pinterest
        # :main_article_image - The image shown on blog homepage and included in the meta_image and the json-ld image metadata - should be square
        # :second_article_image - The image included in the json-ld image metadata - should be square
        'why_we_started_neverbeenworn' => {
            :id => 'why_we_started_neverbeenworn',
            :title => "Why we started NeverBeenWorn",
            :description => "Why we want to be an advocate of change and help you find a home for all the things you have that have never been worn",
            :created => Date.new(2022,7,5),
            :updated => Date.new(2022,7,5),
            :category => "Biography",
            :tags => ['sustainable fashion', 'entrepreneur', 'style'],
            :main_article_image => "blog/lady-in-poppy-field.jpg",
            :main_image_alt_text => "A lady stands in a poppy field. She is wearing a white hat and dress, and her arms are outstretched. She is free and at peace.",
            :main_image_placeholder_colour => "#f7f3f0",
            :second_article_image => "blog/globe-in-park.jpg"
        },
        'sustainability_in_autumn' => {
            :id => 'sustainability_in_autumn',
            :title => 'Sustainability in autumn',
            :description => "As NeverBeenWorn goes into its first autumn, we are taking a quick moment to reflect on how far we have come and looking forward to the next steps on our journey to support sustainable fashion",
            :created => Date.new(2022,10,9),
            :updated => Date.new(2022,10,9),
            :related => ['sustainability_the_right_choice'],
            :category => 'Sustainability',
            :tags => ['sustainable fashion'],
            :main_article_image => "blog/sustainability-in-autumn/autumn-leaves-sunlight.jpg",
            :main_image_alt_text => "Bright afternoon sun shines through the autumn leaves of a young maple tree.",
            :main_image_placeholder_colour => "#e94f53",
            :second_article_image => "blog/sustainability-in-autumn/lady-autumn-blue-coat.jpg"
        },
        'big_boots_how_to_wear_them' => {
            :id => 'big_boots_how_to_wear_them',
            :title => 'Big Boots - How to Wear Them',
            :description => "Big boots are here for another autumn and winter season. Here's how to choose the right pair for you",
            :created => Date.new(2022,11,15),
            :updated => Date.new(2022,11,15),
            :category => "Fashion",
            :tags => ['fashion', 'fashion advice', 'boots'],
            :main_article_image => "blog/big-boots/sitting-on-plinth-square.jpg",
            :main_image_alt_text => "Sitting casually on the plinth of a column, wearing a mid-length brown coat, skinny ripped jeans and big black boots.",
            :main_image_placeholder_colour => "#e1dfd9",
            :second_article_image => "blog/big-boots/white-boots-sitting.jpg"
        },
        'the_wardrobe_challenge' => {
            :id => 'the_wardrobe_challenge',
            :title => 'The Wardrobe Challenge',
            :description => "Take back your wardrobe and banish that mess for good",
            :created => Date.new(2022,11,19),
            :updated => Date.new(2022,11,19),
            :related => ['declutter_me_happy','declutter_your_handbags','fix_your_drawers_forever', 'too_many_scarves', 'get_your_messy_shelves_in_shape','declutter_after_christmas'],
            :category => 'Decluttering',
            :tags => ['decluttering', 'wardrobe', 'storage', 'simple life', 'home organisation', 'organising', 'making habits'],
            :main_article_image => "blog/wardrobe-challenge/choosing-clothes.jpg",
            :main_image_alt_text => "Choosing between a plain white shirt and a white and green striped top.",
            :main_image_placeholder_colour => "#e7c5a9",
            :second_article_image => "blog/wardrobe-challenge/full-wardrobe.jpg"
        },
        'too_many_scarves' => {
            :id => 'too_many_scarves',
            :title => 'Too Many Scarves',
            :description => "How I decluttered and went from hoarding 18 scarves to only needing 4",
            :created => Date.new(2022,12,14),
            :updated => Date.new(2022,12,14),
            :related => ['declutter_me_happy','declutter_your_handbags','fix_your_drawers_forever', 'the_wardrobe_challenge', 'get_your_messy_shelves_in_shape','declutter_after_christmas'],
            :category => 'Decluttering',
            :tags => ['decluttering', 'scarves', 'storage', 'simple life', 'home organisation', 'organising', 'making habits'],
            :main_article_image => "blog/too-many-scarves/knitted-cosy-scarves.jpg",
            :main_image_alt_text => "Three cozy and soft woolen scarves in a pile.",
            :main_image_placeholder_colour => "#f4f3e9",
            :second_article_image => "blog/too-many-scarves/scarves-white-green-grey.jpg"
        },
        'fix_your_drawers_forever' => {
            :id => 'fix_your_drawers_forever',
            :title => 'Fix your drawers forever',
            :description => "How to fix your nightmare drawers forever",
            :created => Date.new(2022,12,16),
            :updated => Date.new(2022,12,16),
            :related => ['declutter_me_happy','declutter_your_handbags','too_many_scarves', 'the_wardrobe_challenge', 'get_your_messy_shelves_in_shape','declutter_after_christmas'],
            :category => 'Decluttering',
            :tags => ['decluttering', 'drawers', 'storage', 'simple life', 'home organisation', 'organising', 'making habits'],
            :main_article_image => "blog/fix-your-drawers-forever/overflowing-drawers.jpg",
            :main_image_alt_text => "Clothes overflow from all three drawers of a chest of drawers.",
            :main_image_placeholder_colour => "#f1f0ec",
            :second_article_image => "blog/fix-your-drawers-forever/piling-clothes-neatly.jpg"
        },
        'me_time' => {
            :id => 'me_time',
            :title => 'Me Time',
            :description => "Get truly focused with my relaxing 'just for me' day. It's the best way to unwind, make new plans and get yourself ready for anything",
            :created => Date.new(2023,1,10),
            :updated => Date.new(2023,1,10),
            :related => ['declutter_me_happy'],
            :category => 'Wellness',
            :tags => ['relax', 'goals', 'resolutions', 'spa', 'mental health', 'happiness'],
            :main_article_image => "blog/me-time/relaxing-bath.jpg",
            :main_image_alt_text => "A relaxing bath surrounded by candles, a good book and a hot drink.",
            :main_image_placeholder_colour => "#fdf7e0",
            :second_article_image => "blog/me-time/holding-cup.jpg"
        },
        'sustainability_the_right_choice' => {
            :id => 'sustainability_the_right_choice',
            :title => "Sustainability - It's The Right Choice",
            :description => "Our never-ending consumption has caused some severe environmental damage. Here’s why sustainability is the right choice",
            :created => Date.new(2023,1,10),
            :updated => Date.new(2023,1,10),
            :related => ['sustainability_in_autumn'],
            :category => 'Sustainability',
            :tags => ['sustainabile fashion'],
            :main_article_image => "blog/sustainability/globe-in-field.jpg",
            :main_image_alt_text => "A brightly-coloured child's globe sits in a field with daisies and other plants growing around it.",
            :main_image_placeholder_colour => "#3fd6d9",
            :second_article_image => "blog/sustainability/recycling-boxes.jpg"
        },
        'get_your_messy_shelves_in_shape' => {
            :id => 'get_your_messy_shelves_in_shape',
            :title => "Get Your Messy Shelves In Shape",
            :description => "Are your shelves always a mess? Here’s how to fix that mess for good",
            :created => Date.new(2023,1,10),
            :updated => Date.new(2023,1,10),
            :related => ['declutter_me_happy','declutter_your_handbags','too_many_scarves', 'the_wardrobe_challenge', 'fix_your_drawers_forever','declutter_after_christmas'],
            :category => 'Decluttering',
            :tags => ['decluttering', 'shelves', 'storage', 'simple life', 'home organisation', 'organising', 'making habits'],
            :main_article_image => "blog/messy-shelves/messy-shelf-tops-and-jeans.jpg",
            :main_image_alt_text => "A messy bedroom shelf holds a jumble of tops, jeans, and t-shirts.",
            :main_image_placeholder_colour => "#fcdde6",
            :second_article_image => "blog/messy-shelves/holding-crumpled-clothes-on-floor.jpg"
        },
        'declutter_after_christmas' => {
            :id => 'declutter_after_christmas',
            :title => "Declutter After Christmas",
            :description => "Christmas declutter – less stress on your head, your home and your wallet",
            :created => Date.new(2023,1,26),
            :updated => Date.new(2023,1,26),
            :related => ['declutter_me_happy','declutter_your_handbags','too_many_scarves', 'the_wardrobe_challenge', 'fix_your_drawers_forever','get_your_messy_shelves_in_shape'],
            :category => 'Decluttering',
            :tags => ['decluttering', 'christmas', 'buying presents', 'gift giving', 'money saving', 'money management', 'unwanted gifts', 'top tips', 'friends'],
            :main_article_image => "blog/christmas/too-many-gifts.jpg",
            :main_image_alt_text => "A lady is overwhelmed by the number of spotty and polka-dotted dresses and shirts in her wardrobe.",
            :main_image_placeholder_colour => "#eb0104",
            :second_article_image => "blog/christmas/opening-gifts.jpg"
        },
        'declutter_your_handbags' => {
            :id => 'declutter_your_handbags',
            :title => "How to declutter your handbags",
            :description => "How to declutter your handbags and save money in the future",
            :created => Date.new(2023,2,10),
            :updated => Date.new(2023,4,8),
            :related => ['declutter_me_happy','too_many_scarves', 'the_wardrobe_challenge', 'fix_your_drawers_forever','get_your_messy_shelves_in_shape','declutter_after_christmas'],
            :category => 'Decluttering',
            :tags => ['decluttering', 'christmas', 'buying presents', 'gift giving', 'money saving', 'money management', 'unwanted gifts', 'top tips', 'friends'],
            :main_article_image => "blog/declutter-handbags/luxury-handbag-on-armchair.jpg",
            :main_image_alt_text => "A luxury handbag sits on a plush grey armchair.",
            :main_image_placeholder_colour => "#556377",
            :second_article_image => "blog/declutter-handbags/beach-bags.jpg"
        },
        'declutter_me_happy' => {
            :id => 'declutter_me_happy',
            :title => "Will decluttering make me happy?",
            :description => "Quick helpful tricks to get rid of all the unhappy clutter in your life",
            :created => Date.new(2023,3,30),
            :updated => Date.new(2023,3,30),
            :related => ['too_many_scarves', 'the_wardrobe_challenge', 'me_time', 'fix_your_drawers_forever','get_your_messy_shelves_in_shape','declutter_after_christmas'],
            :category => 'Decluttering',
            :tags => ['decluttering', 'mind-health', 'top tips', 'happiness', 'home organisation'],
            :main_article_image => "blog/declutter-me-happy/sitting-white-chair-no-clutter.jpg",
            :main_image_alt_text => "A lady listens to music while sitting on a suspended white chair in her bedroom. The room is tidy and uncluttered but not not minimalist, with healthy pot plants and a collection of pillows on the bed.",
            :main_image_placeholder_colour => "#e2e5ec",
            :second_article_image => "blog/declutter-me-happy/standing-by-dresser-with-drink.jpg"
        }
    }

    # the main page with the index of all articles
    def index
        # just show the index
        render locals: {
            articles: ARTICLES
        }
    end

    # a particular article, using encoded title as the ID
    # the ID will match the filename of the article partial under views > articles > article
    def show
        if !article_exists(params[:id])
            flash[:error] = t("blog.article_not_found")
            redirect_to articles_path and return
        end

        article_id = params[:id]
        render locals: {
            article_id: article_id,
            article_data: ARTICLES[article_id],
            social_title: ARTICLES[article_id][:title],
            social_description: ARTICLES[article_id][:description]
        }
    end

    private

    def article_exists(id)
        id.present? && ARTICLES.key?(id)
    end
end
