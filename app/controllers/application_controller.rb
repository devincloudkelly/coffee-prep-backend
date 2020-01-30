class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'someSecretToken')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'someSecretToken', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
            byebug
        end
    end
    
    def current_user
        if decoded_token
            current_user_id = decoded_token[0]['current_user_id']
            @user = User.find_by(id: current_user_id)
        end
    end 

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in'}, status: :unauthorized unless logged_in?
    end

end
