class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
 
  def create
    byebug
    user = User.find_by(email_address: user_login_params[:email_address])
    #User#authenticate comes from BCrypt
    if user && user.authenticate(user_login_params[:password_digest])
      # encode token comes from ApplicationController
      token = encode_token({ current_user_id: user.id })
      render json: { user: user, jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end
 
  private
 
  def user_login_params
    # may  need to change params from :password to :password_digest. If so, change above as well.
    params.require(:user).permit(:name, :password_digest)
  end
end
