class CartController < ApplicationController
  def index
    @items = shopping_cart.orderitems.all.sort
  end
end