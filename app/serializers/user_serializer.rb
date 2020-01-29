class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email_address, :password, :has_aeropress, :has_chemex, :has_pourover
end
