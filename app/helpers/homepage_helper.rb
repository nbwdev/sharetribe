module HomepageHelper
  def show_subcategory_list(category, current_category_id)
    category.id == current_category_id || category.children.any? do |child_category|
      child_category.id == current_category_id
    end
  end

  def with_first_listing_image(listing, &block)
    Maybe(listing)
      .listing_images
      .map { |images| images.first }[:big].each { |url|
      block.call(url)
    }
  end

  def without_listing_image(listing, &block)
    if listing.listing_images.size == 0
      block.call
    end
  end

  def format_distance(distance)
    precision = (distance < 1) ? 1 : 2
    (distance < 0.1) ? "< #{number_with_delimiter(0.1, locale: locale)}" : number_with_precision(distance, precision: precision, significant: true, locale: locale)
  end

  def applied_price_filter_text(price_min, price_max)

    min = price_min ? MoneyUtil.parse_str_to_money(price_min, @current_community.currency) : nil
    max = price_max ? MoneyUtil.parse_str_to_money(price_max, @current_community.currency) : nil

    if (valid_float(price_min) && valid_float(price_max))
      min = MoneyUtil.parse_str_to_money(price_min, @current_community.currency)
      max = MoneyUtil.parse_str_to_money(price_max, @current_community.currency)

      if min == 0
        "up to £" + price_max
      elsif max >= min
        "£" + price_min + " to £" + price_max
      else
        nil
      end
    elsif (valid_float(price_min) && min > 0)
      "£" + price_min + " and up"
    elsif (valid_float(price_max))
      "up to £" + price_max
    else
      nil
    end
  end

  def valid_float(str)
    !!Float(str) rescue false
  end
end