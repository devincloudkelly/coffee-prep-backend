class StepSerializer < ActiveModel::Serializer
  attributes :id, :action, :duration, :amount, :order, :directions
  has_one :preparation
end
