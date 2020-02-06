class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        user = User.find_by(id: params[:id])
        user.preps = User.preparations
        render json: user, status: :accepted
    end

    def create
        user = User.create(user_params)
        if user.valid?
            @token = encode_token(current_user_id: user.id)
            render json: { user: user, jwt: @token }, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)
        render json: user
    end


    private

    def user_params
        params.require(:user).permit(:name, :email_address, :password)
    end

end

# used to test that I can create a new user and they are issued an auth token.

# fetch('http://localhost:3000/api/v1/users', {
#   method: 'POST',
#   headers: {
#     'Content-Type': 'application/json',
#     Accept: 'application/json'
#   },
#   body: JSON.stringify({
#     user: {
#       name: 'Taylor',
#       password_digest: 'abc',
#       email_address: 'taylor@gmail.com'
#     }
#   })
# })
#   .then(r => r.json())
#   .then(console.log)