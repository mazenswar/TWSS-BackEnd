class UserSerializer < ActiveModel::Serializer
  attributes :id, :messages, :conversations, :username, :password_digest, :profile_img
  has_many :messages
  has_many :user_convos
  has_many :conversations, through: :user_convos

end
