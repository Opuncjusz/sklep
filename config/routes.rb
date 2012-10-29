Sklep::Application.routes.draw do
  root :to => "shop#index"
  resources :product, :only => [:show, :update, :destroy]
  resources :category, :only => [:show]
  resources :cart, :only => [:index, :update]
end
