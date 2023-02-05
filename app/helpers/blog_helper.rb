module BlogHelper

    def related_articles(id)
        article = BlogController::ARTICLES[id]

        if article.present? && article[:related].present?
            article[:related]
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
end
