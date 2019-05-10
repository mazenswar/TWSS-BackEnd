class Person < ApplicationRecord
  has_many :quotes
  has_one :bio
  has_one :philosophy
end
