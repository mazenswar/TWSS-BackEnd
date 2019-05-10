class Conversation < ApplicationRecord
    has_many :messages
    has_many :user_convos
    has_many :users, through: :user_convos
end
