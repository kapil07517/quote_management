Rails.application.routes.draw do

	# get 'auth/:provider/callback', to: 'social_sites#create'
 #  get 'auth/failure', to: redirect('/')

  get 'home/index'

  root to: "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "social_sites" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
end
