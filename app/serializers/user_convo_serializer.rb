class UserConvoSerializer < ActiveModel::Serializer
  attributes :id, :user, :conversation
  belongs_to :user
  belongs_to :conversation
end
