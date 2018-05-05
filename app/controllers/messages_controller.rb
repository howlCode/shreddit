class MessagesController < ApplicationController
	before_action :authenticate_user!

	def index
		@messages = current_user.messages.all
	end

	def show
		@message = Message.find(params[:message_id])
	end

	def new
    @message = current_user.messages.build
  end
  
  def edit
  end

  def create
  	@message = current_user.messages.build(message_params)

    if @message.save
      redirect_to @message
    else
      render 'new'
    end
  end

  def destroy
    @message.destroy

    redirect_to user_messages_path
  end

  private

  	def message_params
      params.require(:message).permit(:subject, :body, :user_id)
    end

end
