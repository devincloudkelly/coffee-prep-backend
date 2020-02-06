class UserSerializer < ActiveModel::Serializer
  # ActiveModelSerializers.config.default_includes = '**'
  attributes :id, :name, :email_address, :password, :has_aeropress, :has_chemex, :has_pourover
  has_many :preparations

  def show
    @user = User.find(params[:id])
    render json: @user, include: ['preparations', 'preparations.step']
  end
  
end
