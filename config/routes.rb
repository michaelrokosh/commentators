Commentators::Application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users
  resources :images do
  	resources :comments
  end
end
