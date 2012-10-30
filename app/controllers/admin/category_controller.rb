#!/bin/env ruby
# encoding: utf-8
class Admin::CategoryController < Admin::AdminController
  def index
    @categories = Category.all
  end
  
  def new
    @cat = Category.new
    
  end
  
  def create
    if Category.create(params[:category])
      redirect_to admin_category_index_path, :notice => "Dodano kategorię"  
    else
      redirect_to admin_category_index_path, :alert => "Nie udało się dodać kategorii"
    end    
  end
    
  def show
    @category = Category.find(params[:id])
  end
  
  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_category_index_path, :notice => "Usunięto kategorię"
  end
  
  def update
    if Category.find(params[:id]).update_attributes(params[:category])
      redirect_to admin_category_index_path, :notice => "Zmieniono nazwę kategorii"
    else
      redirect_to admin_category_index_path, :notice => "Nie zmieniono nazwy kategorii"
    end
    
  end
  
end