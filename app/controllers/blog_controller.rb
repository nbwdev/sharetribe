class BlogController < ApplicationController

    ARTICLES = 
    {
        'why_we_started_neverbeenworn' => {
            :id => 'why_we_started_neverbeenworn',
            :title => "Why we started NeverBeenWorn",
            :created => Date.new(2022,7,5)
        },
        'sustainability_in_autumn' => {
            :id => 'sustainability_in_autumn',
            :title => 'Sustainability in autumn',
            :created => Date.new(2022,10,9)
        },
        'big_boots_how_to_wear_them' => {
            :id => 'big_boots_how_to_wear_them',
            :title => 'Big Boots - How to Wear Them',
            :created => Date.new(2022,11,15)
        },
        'the_wardrobe_challenge' => {
            :id => 'the_wardrobe_challenge',
            :title => 'The Wardrobe Challenge',
            :created => Date.new(2022,11,19)
        },
        'too_many_scarves' => {
            :id => 'too_many_scarves',
            :title => 'Too Many Scarves',
            :created => Date.new(2022,12,14)
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
            article_data: ARTICLES[article_id]
        }
    end

    private

    def article_exists(id)
        id.present? && ARTICLES.key?(id)
    end
end
