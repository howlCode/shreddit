Rails.application.routes.draw do
  
  root to: 'posts#index'

  devise_for :users
  resources :users do
  	resource :profile
	end

  resources :subshreddits

	resources :posts do
		resources :comments
	end

end
