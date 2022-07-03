# Articles

Articles are added to the index page at /articles which links to each article

## Adding an article

To add an article, you need to:

1. Decide on the title, for example "My New Article"
2. Convert the title to an ID which will be used in the URL, for example "my_new_article"
3. Update `articles_controller` to add your article to `ARTICLES`
4. Add a partial to `app/views/articles/article` - for example `app/views/articles/article/_my_new_article.haml`
5. Add any new images to app/assets/images/articles

## TODOs
Currently the index.haml uses hard coded text and layout. Will want to add the layout to the controller to start with, and probably also add the intro text in there too or have another partial with this in for consistency.

Would like to fade out the text before the "Read more" button.
