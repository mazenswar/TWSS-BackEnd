class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :messages
  has_many :user_convos
  has_many :conversations, through: :user_convos
end
