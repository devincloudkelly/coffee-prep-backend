class Preparation < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true
end
