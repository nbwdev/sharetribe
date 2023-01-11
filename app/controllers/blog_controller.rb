class BlogController < ApplicationController

    ARTICLES = 
    {
        'why_we_started_neverbeenworn' => {
            :id => 'why_we_started_neverbeenworn',
            :title => "Why we started NeverBeenWorn",
            :description => "We want to help all you lovely ladies out there clear out your wardrobe and find a great new home for all your stylish unworn items",
            :created => Date.new(2022,7,5)
        },
        'sustainability_in_autumn' => {
            :id => 'sustainability_in_autumn',
            :title => 'Sustainability in autumn',
            :description => "As NeverBeenWorn goes into its first autumn, we are taking a quick moment to reflect on how far we have come and looking forward to the next steps in our journey through more sustainable fashion",
            :created => Date.new(2022,10,9)
        },
        'big_boots_how_to_wear_them' => {
            :id => 'big_boots_how_to_wear_them',
            :title => 'Big Boots - How to Wear Them',
            :description => "Big boots are here for another autumn and winter season. Here's how to choose the right pair for you",
            :created => Date.new(2022,11,15)
        },
        'the_wardrobe_challenge' => {
            :id => 'the_wardrobe_challenge',
            :title => 'The Wardrobe Challenge',
            :description => "Take on your wardrobe, take back your time and banish that mess for good",
            :created => Date.new(2022,11,19)
        },
        'too_many_scarves' => {
            :id => 'too_many_scarves',
            :title => 'Too Many Scarves',
            :description => "How I went from 18 scarves to just 4",
            :created => Date.new(2022,12,14)
        },
        'fix_your_drawers_forever' => {
            :id => 'fix_your_drawers_forever',
            :title => 'Fix your drawers forever',
            :description => "From nightmare drawers to no more trouble",
            :created => Date.new(2022,12,16)
        },
        'me_time' => {
            :id => 'me_time',
            :title => 'Me Time',
            :description => "Kick start your new year with my relaxing Just For Me day. It is the best way to unwind, make new plans and get yourself ready for a great year ahead.",
            :created => Date.new(2023,01,10)
        },
        'sustainability_the_right_choice' => {
            :id => 'sustainability_the_right_choice',
            :title => "Sustainability - It's The Right Choice",
            :description => "These days we are all aware of the urgent need to change how and why we have a need to buy more and more stuff. It raises the question: Why do we feel the need to buy so much?",
            :created => Date.new(2023,01,10)
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
