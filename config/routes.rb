Sklep::Application.routes.draw do
  
  namespace :admin do
    root :to => "order#index"
    resources :order, :only => [:index, :show]
    resources :product
    resources :category
    
    devise_for :admin_users
  end

  root :to => "shop#index"
  resources :product, :only => [:show, :update, :destroy]
  resources :category, :only => [:show]
  resources :cart, :only => [:index, :new, :create]
end
