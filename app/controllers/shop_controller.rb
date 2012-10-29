#!/bin/env ruby
# encoding: utf-8

class ShopController < ApplicationController
  
  def index
    
    @prod = Product.order(:created_at).limit(10)
    
  end
end
