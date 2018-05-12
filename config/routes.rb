Rails.application.routes.draw do
  
  root to: 'posts#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
  	resource :profile
    resources :messages, only: [:new, :create]
	end
  resources :messages, only: [:index, :show, :destroy]

  resources :subshreddits

	resources :posts do
		resources :comments
	end

end
