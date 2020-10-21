class LikesController < ApplicationController
  def create
    @message = clicked_message
    unless current_user.already_like_this?(@message)
      @like = current_user.like_this(@message)
      flash[:success] = '投稿に「いいね！」しました。'
      if @like.save
        respond_to :js
      end
    end
  end

  def destroy
    @message = clicked_message
    @like = current_user.likes.find_by(message_id: params[:message_id]).destroy
    flash[:danger] = '「いいね！」を解除しました。'
    if @like.destroy
      respond_to :js
    end
  end

  private

  def clicked_message
    Message.find(params[:message_id])
  end

end
