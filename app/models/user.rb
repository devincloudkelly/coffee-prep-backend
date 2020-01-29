class User < ApplicationRecord
    has_secure_password
    validates: :email_address, uniqueness: { case_sensitive: false }
    has_many :preparations
end
