class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = current_user.messages
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      @messages = current_user.messages
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    message.update(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content, :image, :takername).merge(user_id: current_user.id)
  end

end