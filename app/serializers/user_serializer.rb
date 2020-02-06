class UserSerializer < ActiveModel::Serializer
  # ActiveModelSerializers.config.default_includes = '**'
  attributes :id, :name, :email_address, :password, :has_aeropress, :has_chemex, :has_pourover
  has_many :preparations

  # def initialize(user)
  #   @user = user
  # end

  # def deeply_nest
  #   @user.to_json(:include => {
  #     :preparation => {:only => [:id]}
  #   })
  # end
  
end
