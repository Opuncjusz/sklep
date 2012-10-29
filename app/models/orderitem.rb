class Orderitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :order_id, :product_id, :quantity
end
