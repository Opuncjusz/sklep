class CategoryController < ActionController::Base
  def show
    @c = Category.find(params["id"])
    @p = @c.products
  end
end