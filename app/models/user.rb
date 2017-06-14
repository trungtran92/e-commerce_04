class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :suggests, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.name_user_maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email_maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.password_minimum}, allow_nil: true
    has_secure_password
end
