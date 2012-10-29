class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderitems
  attr_accessible :confirmed

end