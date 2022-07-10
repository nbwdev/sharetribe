class ArticlesController < ApplicationController

    ARTICLES = 
    {
        'why_we_started_neverbeenworn' => {
            :id => 'why_we_started_neverbeenworn',
            :title => "Why We Started Neverbeenworn",
            :created => Date.new(2022,7,5)
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
            flash[:error] = t("articles.article_not_found")
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
