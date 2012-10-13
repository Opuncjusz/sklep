class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :catetory_id
  belongs_to :category
end
