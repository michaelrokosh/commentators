Commentators::Application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users
  resources :images do
  	resources :comments do
  		member do
        post :vote_up
        post :vote_down
      end
    end
  end
end
