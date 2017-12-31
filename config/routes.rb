Rails.application.routes.draw do

  get 'notification/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'users#home'
	resources :users do
	  collection do
	  	get 'home'
	  	get 'people_book'
		end
		member do 
			get 'profile'
	    get 'friends'
		end
		resources :notifications, only: [:index] do
			delete 'clean' 
		end
	end

	resources :business_logs

	resources :posts

	resources :friendships, only: [:create, :update, :destroy]

	resources :comments, only: [:create]

end
