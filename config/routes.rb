Rails.application.routes.draw do
  
  root to: 'posts#index'

  devise_for :users
  resources :users do
  	resources :messages
  	resource :profile
	end

  resources :subshreddits

	resources :posts do
		resources :comments
	end

end
