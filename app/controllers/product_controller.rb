class ProductController < ActionController::Base
  
  def show
    @p = Product.find(params["id"])
  end
end