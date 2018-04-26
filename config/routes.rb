Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :subshreddits

	resources :posts do
		resources :comments
	end

end
