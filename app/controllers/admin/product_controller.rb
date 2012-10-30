#!/bin/env ruby
# encoding: utf-8
class Admin::ProductController < Admin::AdminController
  def index
    @products = Product.all
  end
  
  def new
    @prod = Product.new
    @categories = Category.all.map {|x| [x.name, x.id]}

  end
  
  def create
    if Product.create(params[:product])
      redirect_to admin_product_index_path, :notice => "Dodano produkt"  
    else
      redirect_to admin_product_index_path, :alert => "Nie udało się dodać produktu"
    end    
  end
    
  def show
    @product = Product.find(params[:id])
    @categories = Category.all.map {|x| [x.name, x.id]}
  end
  
  def destroy
    Product.find(params[:id]).destroy
    redirect_to admin_product_index_path, :notice => "Usunięto produkt"
  end
  
  def update
    if Product.find(params[:id]).update_attributes(params[:product])
      redirect_to admin_product_index_path, :notice => "Zmieniono produkt"
    else
      redirect_to admin_product_index_path, :notice => "Nie udało się zmienić produktu"
    end
    
  end
  
end