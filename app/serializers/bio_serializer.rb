class BioSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :person
end
