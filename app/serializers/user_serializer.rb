class UserSerializer < ActiveModel::Serializer
  ActiveModelSerializers.config.default_includes = '**'
  attributes :id, :name, :email_address, :password, :has_aeropress, :has_chemex, :has_pourover
  has_many :preparations
end
