#!/bin/env ruby
# encoding: utf-8

class ShopController < ActionController::Base
  def index
    render :text => "Dzień dobry! Sklep zaprasza!"
  end
end
