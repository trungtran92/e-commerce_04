class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :category_id, presence:true
  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :price, presence: true,
    length: {maximum: Settings.maximum_price, minimum: Settings.minimum_price}

  scope :trend_product, ->{order(rate_point: :asc, created_at: :desc)
    .limit Settings.hot_trend_products}
  scope :search, ->search {where "name || price like ?", "%#{search}%"}
  scope :approved_status, ->{where(status: true)}
  scope :alphabet, -> {order(name: :asc)}
  scope :rating, -> {order(rate_point: :desc)}
  scope :price_high_to_low, -> {order(price: :desc)}
  scope :price_low_to_high, -> {order(price: :asc)}
  ratyrate_rateable "rating"
end
