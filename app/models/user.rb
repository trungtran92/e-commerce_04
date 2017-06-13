class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :suggests, dependent: :destroy
end
