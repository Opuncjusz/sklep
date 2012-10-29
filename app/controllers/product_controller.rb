#!/bin/env ruby
# encoding: utf-8

class ProductController < ApplicationController
  
  def show  
    @p = Product.find(params["id"])
    order_item = shopping_cart.orderitems.where(:product_id => params["id"])
    if order_item.length == 0
      @quantity = 0
    else
      order_item = order_item.first
      @quantity = order_item.quantity
    end
    
  end
  
  def change_quantity_in_cart x, komunikat
    order_item = Orderitem.where(:order_id => shopping_cart.id, :product_id => params["id"])
    if order_item.length == 0
      order_item = Orderitem.new(:order_id => shopping_cart.id, :product_id => params["id"])
      order_item.quantity = x;
    else
      order_item = order_item.first
      order_item.quantity += x
    end
    
    if order_item.quantity < 1
      order_item.destroy
      redirect_to :back, :notice => komunikat
    elsif order_item.save 
      redirect_to :back, :notice => komunikat
    else
      redirect_to :back, :alert => "Nie udało się zapisać zmian!"
    end
  end
  
  def update
    change_quantity_in_cart 1, "Dodano produkt do koszyka"
  end
  
  
  def destroy
    change_quantity_in_cart -1, "Usunięto jedną sztukę z koszyka"
  end
  
end