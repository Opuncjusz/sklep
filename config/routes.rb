Sklep::Application.routes.draw do
  root :to => "shop#index"
  resources :product
  resources :category
end
