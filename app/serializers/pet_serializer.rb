class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :breed, :age, :weight
  has_one :users
end
