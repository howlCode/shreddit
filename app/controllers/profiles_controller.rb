class ProfilesController < ApplicationController
	before_action :authenticate_user!
  
  def show
  	@user = User.find(params[:user_id])

  	if current_user
  		@messages = current_user.messages.all
  	end
  end
end