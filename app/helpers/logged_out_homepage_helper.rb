module LoggedOutHomepageHelper

  module_function

  def get_carousel_cards()
    [
      {
        :item_class => "",
        :image_path => "logged_out_homepage/tailored-jacket.jpg",
        :alt_text => "A lady stands in a tailored herringbone grey jacket with her hands in the pockets of her black Gucci-belted jeans. Her sun glasses are on her head.",
        :tip_title => "Autumn Tips",
        :tip_text => "Give your outfit<br>a designer feel<br>with a tailored jacket".html_safe
      },
      {
        :item_class => "carousel-hide",
        :image_path => "logged_out_homepage/autumn-leggings.jpg",
        :alt_text => "The bottom half of someone wearing black leggings, yellow Timberland-style boots and a red puffer jacket.",
        :tip_title => "Autumn Tips",
        :tip_text => "Match your leggings<br>with ankle boots<br>for a longer leg".html_safe
      },
      {
        :item_class => "carousel-hide",
        :image_path => "logged_out_homepage/black-tops-go-with-everything.jpg",
        :alt_text => "A woman standing in an autumn forest and wearing a black rollneck top looks directly into the camera. She smiles with her head tilted slightly to one side.",
        :tip_title => "Autumn Tips",
        :tip_text => "Black tops go<br>with everything<br>Always be sure<br>to have a few".html_safe
      },
      {
        :item_class => "carousel-hide",
        :image_path => "logged_out_homepage/dont-be-afraid-of-colour.jpg",
        :alt_text => "A woman wearing black top and trousers, accessorised with a vibrant orange-red coat and matching bag.",
        :tip_title => "Autumn Tips",
        :tip_text => "If you wear mostly&nbsp;black<br>add one new colour<br>for effortless chic".html_safe
      },
      {
        :item_class => "carousel-hide",
        :image_path => "logged_out_homepage/upgrade-with-an-elegant-scarf.jpg",
        :alt_text => "A woman stands under the arched walkway on a European street. She wears a fresh pastel pink long wool coat with a paisley scarf. She is looking intently into the window of a nearby store.",
        :tip_title => "Autumn Tips",
        :tip_text => "Is your outfit feeling<br>a bit casual?<br>Add an elegant scarf<br>for an instant upgrade".html_safe
      }
    ]
  end
end
