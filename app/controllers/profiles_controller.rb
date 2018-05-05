class ProfilesController < ApplicationController
  
  def show
  	@user = User.find(params[:user_id])

  	if current_user
  		@messages = current_user.messages.all
  	end
  end
end