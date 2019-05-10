class UserConvo < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
end
