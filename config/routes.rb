Commentators::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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
