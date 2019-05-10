class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_img, :index_img
  has_one :bio
  has_one :philosophy
  has_many :quotes
end
