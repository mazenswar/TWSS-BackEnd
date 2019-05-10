class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user, :conversation, :created_at, :content
  belongs_to :user
  belongs_to :conversation
end
