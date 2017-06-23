module ApplicationHelper
  def full_title page_title = ""
    if page_title.empty?
      t "title_project"
    else
      page_title + " | " + t("title_project")
    end
  end

  def price_each_product_in_cart product, quantity
    return product.price.to_i * quantity.to_i
  end
end
