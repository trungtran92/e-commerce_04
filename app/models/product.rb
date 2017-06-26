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

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = find_by_id(row["id"]) || new
      user.attributes = row.to_hash.slice(*row.to_hash.keys)
      user.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
