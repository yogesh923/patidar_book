Rails.application.routes.draw do
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
	end
	resources :friendships do
	end

	resources :business_logs do
	end

	resources :posts do
	end
end
