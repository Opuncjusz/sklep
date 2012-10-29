class CategoryController < ApplicationController
  
  def show
    @c = Category.find(params["id"])
    @p = @c.products
  end
end