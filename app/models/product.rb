class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :rates, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :category_id, presence:true
  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :price, presence: true,
    length: {maximum: Settings.maximum_price, minimum: Settings.minimum_price}

  scope :trend_product, ->{order(rate_point: :asc, created_at: :desc)
    .limit Settings.hot_trend_products}
end
