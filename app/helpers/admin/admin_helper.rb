module Admin::AdminHelper
  def page params_page
    params_page.nil? ? 1 : params_page.to_i
  end

  def admin_page params_page, object_counter
    page = page params_page
    (page - 1) * Settings.per_page + object_counter + 1
  end
end
