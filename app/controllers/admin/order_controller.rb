class Admin::OrderController < Admin::AdminController
  
  def index
     @orders = Order.where(:confirmed => true).all
  end
  
  def show
     @order = Order.find(params[:id])
     @items = @order.orderitems.all 
  end
  
end