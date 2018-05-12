class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_recipient, only: [:new, :create]

	def index
	  @messages = current_user.messages.all
	end

	def show
	  @message = Message.find(params[:id])
	  @sender = User.find(@message.sender_id)
	end

	def new
	  @message = current_user.messages.build
	end

	def create
	  @message = current_user.messages.build(message_params)
	  @message.recipient_id = @recipient.id
	  @message.sender_id = current_user.id
	  if @message.save
	  	redirect_to @message
		else
			flash.now[:unsuccessful]
			render 'new'
		end
	end

	def destroy
	  @message = Message.destroy(params[:id])

	  redirect_to user_profile_path(current_user)
	end

	private

	 def message_params
	    params.require(:message).permit(:subject, :body, :recipient_id, :sender_id)
	 end

	 def set_recipient
     @recipient = User.find(params[:user_id])
	 end

end