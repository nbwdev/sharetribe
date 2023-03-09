module BlogHelper

    def related_articles(id, how_many = 99)
        article = BlogController::ARTICLES[id]

        if article.present? && article[:related].present?
            article[:related].first(how_many)
        else
            []
        end
    end

    def article_tags(id)
        article = BlogController::ARTICLES[id]

        if article.present? && article[:tags].present?
            article[:tags]
        else
            []
        end
    end

    def article(id)
        article = BlogController::ARTICLES[id]

        article
    end
end
