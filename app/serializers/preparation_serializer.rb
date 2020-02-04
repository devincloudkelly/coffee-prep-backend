class PreparationSerializer < ActiveModel::Serializer
  attributes :id, :device, :coffee_brand, :coffee_name, :coffee_amount, :coffee_grind, :total_water, :total_time, :water_temp, :notes
  has_one :user
  has_many :steps
  
end
