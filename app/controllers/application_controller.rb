class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_subshreddits

  private
  	def load_subshreddits
  		@subshreddits = Subshreddit.all
  	end
end
