Sklep::Application.routes.draw do
  root :to => "shop#index"
  resources :product
end
