#!/bin/env ruby
# encoding: utf-8
class CartController < ApplicationController
  def index
    @items = shopping_cart.orderitems.all.sort
  end
  
  def new
    @items = shopping_cart.orderitems.all
  end
  
  def create
    cart = shopping_cart
    cart.full_address = params[:full_address]
    cart.confirmed = true
    if cart.save
      redirect_to :root, :notice => "Udało się przyjąć zamówienie!"
    else
      redirect_to :root, :alert => "Niestety, nie udało się przyjąć zamówienia"
    end
  end
end