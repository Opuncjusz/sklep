class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  helper_method :shopping_cart, :current_buyer
  
  def current_buyer
    if cookies[:buyer_id] == nil or not Buyer.where(:id => cookies[:buyer_id]).exists
      cookies[:buyer_id] = Buyer.create.id
    end
    return Buyer.find(cookies[:buyer_id])
  end
  
  def shopping_cart
    current_buyer.orders.where(:confirmed => false).first || current_buyer.orders.create(:confirmed => false)
  end
  
  
  
end
