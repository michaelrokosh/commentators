Commentators::Application.routes.draw do
  get "omniauth_callbacks/vkontakte"
  get "users/controller"
  resources :images do
    member do
      post :godnota
    end
  	resources :comments do
  		member do
        post :vote_up
        post :vote_down
      end
    end
  end
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", :registrations => "registrations" }
  resources :users
  get '/dniwe', to: 'home#dniwe', as: :dniwe
  root 'home#index'
end
