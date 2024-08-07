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
            :second_article_image => "blog/globe-in-park.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/"
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
            :second_article_image => "blog/sustainability-in-autumn/lady-autumn-blue-coat.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/"
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
            :second_article_image => "blog/christmas/opening-gifts.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/declutter-after-christmas/?from_nbw=true"
        },
        'big_boots_how_to_wear_them' => {
            :id => 'big_boots_how_to_wear_them',
            :title => 'Big Boots - Are Back This Season',
            :description => "Big boots are here for another autumn and winter season. Here's how to choose the right pair for you",
            :created => Date.new(2022,11,15),
            :updated => Date.new(2023,10,8),
            :related => ['top_5_fixes_for_autumn','baggy_suit','declutter_your_handbags'],
            :category => "Fashion",
            :tags => ['fashion', 'fashion advice', 'boots'],
            :main_article_image => "blog/big-boots/big-boots-long-coat-square.jpg",
            :main_image_alt_text => "Sitting casually on the plinth of a column, wearing a mid-length brown coat, skinny ripped jeans and big black boots.",
            :main_image_placeholder_colour => "#c9ccc0",
            :second_article_image => "blog/big-boots/sitting-on-plinth.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/big-boots-are-back-this-season/?from_nbw=true"
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
            :main_article_image => "blog/wardrobe-challenge/tidy-wardrobe-selfie.jpg",
            :main_image_alt_text => "A woman takes a selfie in front of her tidy and organised wardrobe.",
            :main_image_placeholder_colour => "#e7c5a9",
            :second_article_image => "blog/wardrobe-challenge/full-wardrobe.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/the-wardrobe-challenge/?from_nbw=true"
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
            :main_article_image => "blog/too-many-scarves/scarves-organised.jpg",
            :main_image_alt_text => "Five winter scarves neatly organised in a cubby hole.",
            :main_image_placeholder_colour => "#f4f3e9",
            :second_article_image => "blog/too-many-scarves/knitted-cosy-scarves.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/too-many-scarves/?from_nbw=true"
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
            :main_article_image => "blog/fix-your-drawers-forever/tidy-drawer.jpg",
            :main_image_alt_text => "Clothes overflow from all three drawers of a chest of drawers.",
            :main_image_placeholder_colour => "#f1f0ec",
            :second_article_image => "blog/fix-your-drawers-forever/piling-clothes-neatly.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/fix-your-drawers-forever/?from_nbw=true"
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
            :second_article_image => "blog/me-time/holding-cup.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/me-time/?from_nbw=true"
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
            :second_article_image => "blog/sustainability/recycling-boxes.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/"
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
            :main_article_image => "blog/messy-shelves/tidy-shelves.jpg",
            :main_image_alt_text => "A woman in the middle of organising her shelves holds a container with neatly folded clothes, ready to add to the tidy wardrobe behind her.",
            :main_image_placeholder_colour => "#988982",
            :second_article_image => "blog/messy-shelves/holding-crumpled-clothes-on-floor.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/get-your-messy-shelves-in-shape/?from_nbw=true"
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
            :second_article_image => "blog/declutter-handbags/beach-bags.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/declutter-your-handbags/?from_nbw=true"
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
            :second_article_image => "blog/declutter-me-happy/standing-by-dresser-with-drink.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/declutter-me-happy/?from_nbw=true"
        },
        'my_wardrobe_challenge' => {
            :id => 'my_wardrobe_challenge',
            :title => "My wardrobe challenge",
            :description => "My wardrobe nightmare and how I fixed it",
            :created => Date.new(2023,5,10),
            :updated => Date.new(2023,5,10),
            :related => ['the_wardrobe_challenge', 'too_many_scarves', 'me_time', 'fix_your_drawers_forever','get_your_messy_shelves_in_shape','declutter_after_christmas'],
            :category => 'Decluttering',
            :tags => ['decluttering', 'mind-health', 'top tips', 'happiness', 'home organisation'],
            :main_article_image => "blog/my-wardrobe-challenge/messy-wardrobe-drawers.jpg",
            :main_image_alt_text => "Messy wardrobe drawers with shoes on top of them and clothes rammed into the drawers.",
            :main_image_placeholder_colour => "#b3d7f7",
            :second_article_image => "blog/my-wardrobe-challenge/messy-wardrobe-rail.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/my-wardrobe-challenge/?from_nbw=true"
        },
        'summer_beach_bag' => {
            :id => 'summer_beach_bag',
            :title => "Perfect summer beach bag",
            :description => "How to pick the right summer beach bag for less fuss and more beach time",
            :created => Date.new(2023,6,14),
            :updated => Date.new(2023,6,14),
            :related => ['white_trainers','declutter_your_handbags','summer_hat_for_protection'],
            :category => 'Summer',
            :tags => ['summer', 'beach', 'happiness', 'home organisation'],
            :main_article_image => "blog/summer-beach-bag/summer-beach-bag.jpg",
            :main_image_alt_text => "A woven straw beach bag with some essential items poking out of it - sun screen, sunglasses, camera, and notebook.",
            :main_image_placeholder_colour => "#ffe96f",
            :second_article_image => "blog/summer-beach-bag/bag-on-beach.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/summer-beach-bag/?from_nbw=true"
        },
        'white_trainers' => {
            :id => 'white_trainers',
            :title => "White trainers",
            :description => "Why they are still good for your summer wardrobe and your wallet",
            :created => Date.new(2023,6,20),
            :updated => Date.new(2023,7,4),
            :related => ['summer_beach_bag','summer_hat_for_style','summer_hat_for_protection'],
            :category => 'Summer',
            :tags => ['summer', 'white', 'trainers', 'fashion'],
            :main_article_image => "blog/white-trainers/white-trainers-tying-laces.jpg",
            :main_image_alt_text => "A happy woman in a white hoodie, black leggings, and white trainers ties her shoe lace.",
            :main_image_placeholder_colour => "#ffffff",
            :second_article_image => "blog/white-trainers/white-trainers-jeans.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/white-trainers/?from_nbw=true"
        },
        'summer_hat_for_protection' => {
            :id => 'summer_hat_for_protection',
            :title => "Protective summer hats",
            :description => "How to buy the right summer hat to protect yourself in the sun",
            :created => Date.new(2023,7,30),
            :updated => Date.new(2023,8,23),
            :related => ['summer_hat_for_style','summer_beach_bag','white_trainers'],
            :category => 'Summer',
            :tags => ['summer', 'hat', 'sun', 'fashion'],
            :main_article_image => "blog/summer-hat-for-protection/bucket-hat-square.jpg",
            :main_image_alt_text => "A woman wearing a bucket hat to protect herself from the sun, along with an aztec-patterned summer shirt over a white vest top, looks pensively into the middle distance.",
            :main_image_placeholder_colour => "#e23d4d",
            :second_article_image => "blog/summer-hat-for-protection/straw-hat-poolside.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/summer-hat-for-protection/?from_nbw=true"
        },
        'summer_hat_for_style' => {
            :id => 'summer_hat_for_style',
            :title => "Find your summer hat",
            :description => "How to buy a summer hat to suit your entire summer wardrobe",
            :created => Date.new(2023,8,7),
            :updated => Date.new(2023,8,23),
            :related => ['summer_hat_for_protection','summer_beach_bag','white_trainers'],
            :category => 'Summer',
            :tags => ['summer', 'hat', 'sun', 'fashion'],
            :main_article_image => "blog/summer-hat-for-style/white-sun-hat.jpg",
            :main_image_alt_text => "A stylish woman stands near a swimming pool wearing a white sun hat with a black ribbon and a pale yellow summer halter top",
            :main_image_placeholder_colour => "#efe3a7",
            :second_article_image => "blog/summer-hat-for-style/green-cream-natural-summer-outfit-with-palette.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/summer-hat-for-style/?from_nbw=true"
        },
        'baggy_suit' => {
            :id => 'baggy_suit',
            :title => "The baggy suit",
            :description => "A must have item for your hybrid wardrobe this autumn/winter?",
            :created => Date.new(2023,8,25),
            :updated => Date.new(2023,8,25),
            :related => ['big_boots_how_to_wear_them','top_5_fixes_for_autumn','white_shirts'],
            :category => 'Fashion',
            :tags => ['suit', 'fashion', 'business', 'office','hybrid working'],
            :main_article_image => "blog/baggy-suit/three-women-blazers-square.jpg",
            :main_image_alt_text => "Two women mean business in baggy blazers",
            :main_image_placeholder_colour => "#d33a35",
            :second_article_image => "blog/baggy-suit/suit-office-steps.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/baggy-suit/?from_nbw=true"
        },
        'top_5_fixes_for_autumn' => {
            :id => 'top_5_fixes_for_autumn',
            :title => "Top 5 fixes for autumn",
            :description => "Fixes for your autumn wardrobe that you can do right away",
            :created => Date.new(2023,9,27),
            :updated => Date.new(2023,9,27),
            :related => ['big_boots_how_to_wear_them','baggy_suit','too_many_scarves'],
            :category => 'Fashion',
            :tags => ['suit', 'fashion', 'business', 'office','hybrid working'],
            :main_article_image => "blog/top-5-fixes-for-autumn/red-jumper-shopping-square.jpg",
            :main_image_alt_text => "A woman wearing a long red jumper accessorised with a black belt and carrying a few bags from the high-end stores in the street behind her.",
            :main_image_placeholder_colour => "#a83443",
            :second_article_image => "blog/top-5-fixes-for-autumn/long-coat-boots-in-park.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/top-5-fixes-for-autumn/?from_nbw=true"
        },
        'white_shirts' => {
            :id => 'white_shirts',
            :title => "The perfect white shirt",
            :description => "How to buy the right white shirt for you",
            :created => Date.new(2023,10,10),
            :updated => Date.new(2023,10,10),
            :related => ['baggy_suit','big_boots_how_to_wear_them','white_shirt_how_to_wear_it'],
            :category => 'Fashion',
            :tags => ['shirt','suit', 'fashion', 'business', 'office','hybrid working'],
            :main_article_image => "blog/white-shirts/white-shirt-on-stool-square.jpg",
            :main_image_alt_text => "A lady sits on a high stool wearing a balloon-sleeved white shirt and skinny brown trousers.",
            :main_image_placeholder_colour => "#becbd2",
            :second_article_image => "blog/white-shirts/white-shirt-beige-trenchcoat.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/the-perfect-white-shirt/?from_nbw=true"
        },
        'white_shirt_how_to_wear_it' => {
            :id => 'white_shirt_how_to_wear_it',
            :title => "The white shirt - how to wear it",
            :description => "A quick guide on how to wear your perfect white shirt",
            :created => Date.new(2023,10,10),
            :updated => Date.new(2023,10,10),
            :related => ['white_shirts','baggy_suit','big_boots_how_to_wear_them'],
            :category => 'Fashion',
            :tags => ['shirt','suit', 'fashion', 'business', 'office','hybrid working'],
            :main_article_image => "blog/white-shirts-quick-guide/white-shirt-hair-square.jpg",
            :main_image_alt_text => "A lady wearing a crisp white shirt and fitted black trousers.",
            :main_image_placeholder_colour => "#becbd2",
            :second_article_image => "blog/white-shirts-quick-guide/white-shirt-accessories.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/white-shirt-how-to-style-it/?from_nbw=true"
        },
        'winter_scarves' => {
            :id => 'winter_scarves',
            :title => "Your perfect winter scarf",
            :description => "Top 5 key features of buying the perfect scarf to get you through winter",
            :created => Date.new(2023,11,12),
            :updated => Date.new(2023,11,12),
            :related => ['too_many_scarves','winter_jumpers','padded_jackets'],
            :category => 'Fashion',
            :tags => ['scarf','winter', 'fashion', 'knitwear'],
            :main_article_image => "blog/winter-scarves/pale-pink-matching-knits-square.jpg",
            :main_image_alt_text => "A lady smiles in her chunky soft cable-knit jumper, scarf and hat combo.",
            :main_image_placeholder_colour => "#e2d7d6",
            :second_article_image => "blog/winter-scarves/teal-jacket-mustard-scarf.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/your-perfect-winter-scarf/?from_nbw=true"
        },
        'padded_jackets' => {
            :id => 'padded_jackets',
            :title => "The padded winter jacket",
            :description => "How to buy the right jacket and avoid spending too much money",
            :created => Date.new(2023,11,12),
            :updated => Date.new(2023,11,12),
            :related => ['winter_scarves','winter_jumpers','big_boots_how_to_wear_them'],
            :category => 'Fashion',
            :tags => ['jacket','warm', 'fashion', 'winter'],
            :main_article_image => "blog/padded-jackets/grey-padded-jacket-high-street-square.jpg",
            :main_image_alt_text => "A lady on a snowy shopping street wearing a long grey padded jacket, below-knee tan leather boots and a warm wollen hat matching the jacket.",
            :main_image_placeholder_colour => "#d9dade",
            :second_article_image => "blog/padded-jackets/fur-trimmed-white-coat-phone-box.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/the-padded-winter-jacket/?from_nbw=true"
        },
        'winter_jumpers' => {
            :id => 'winter_jumpers',
            :title => "Jumpers: A winter wardrobe essential",
            :description => "Buying a winter jumper that will last until spring",
            :created => Date.new(2023,11,12),
            :updated => Date.new(2023,11,12),
            :related => ['winter_scarves','padded_jackets','big_boots_how_to_wear_them'],
            :category => 'Fashion',
            :tags => ['jumper','winter', 'fashion', 'warm', 'knitwear'],
            :main_article_image => "blog/winter-jumpers/red-jumper-square.jpg",
            :main_image_alt_text => "A lady relaxes on a low stool in a dark red jumper.",
            :main_image_placeholder_colour => "#bd434f",
            :second_article_image => "blog/winter-jumpers/cream-jumper-cross-legged.jpg",
            :migrated => true,
            :migrated_url => "https://lifestyleandjoy.com/jumpers-a-winter-wardrobe-essential/?from_nbw=true"
        }
    }

    # the main page with the index of all articles
    def index
        redirect_to 'https://lifestyleandjoy.com', :status => :moved_permanently  and return
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

        # redirect to LSJ for migrated articles
        if ARTICLES[article_id][:migrated]
            redirect_to ARTICLES[article_id][:migrated_url], :status => :moved_permanently and return
        end

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
