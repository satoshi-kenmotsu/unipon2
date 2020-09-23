class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = current_user.messages
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to user_messages_path(current_user), notice: 'メッセージが送信されました'
    else
      @messages = current_user.messages
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end