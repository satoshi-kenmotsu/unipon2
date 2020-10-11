class LikesController < ApplicationController
  def create
    unless current_user.already_like_this?(clicked_message)
      @like = current_user.like_this(clicked_message)
      flash[:success] = '投稿に「いいね！」しました。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    current_user.likes.find_by(message_id: params[:message_id]).destroy
    flash[:danger] = '「いいね！」を解除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def clicked_message
    Message.find(params[:message_id])
  end

end
