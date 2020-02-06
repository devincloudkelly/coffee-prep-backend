class User < ApplicationRecord
    has_secure_password
    validates :email_address, uniqueness: { case_sensitive: false }
    has_many :preparations, dependent: :destroy
    has_many :steps, through: :preparations
    accepts_nested_attributes_for :preparations, allow_destroy: true
    accepts_nested_attributes_for :steps, allow_destroy: true
end
