module ProductLib
  def filter_products filter
    case filter
    when t("filter.all")
      Product.approved_status
    when t("filter.alpha")
      Product.approved_status.alphabet
    when t(".rating")
      Product.approved_status.rating
    when t("filter.price_high_to_low")
      Product.approved_status.price_high_to_low
    when t("filter.price_low_to_high")
      Product.approved_status.price_low_to_high
    end
  end
end
