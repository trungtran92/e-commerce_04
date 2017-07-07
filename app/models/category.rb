class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, presence: true, length: {maximum: Settings.maximum_name}
end
