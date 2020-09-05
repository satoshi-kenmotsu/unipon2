class MessagesController < ApplicationController
  before_action :set_user

  def index
    @message = Message.new
    @messages = @user.messages.includes(:user)
  end

  def create
    @message = @user.messages.new(message_params)
    if @message.save
      redirect_to user_messages_path(@user), notice: 'メッセージが送信されました'
    else
      @messages = @user.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
