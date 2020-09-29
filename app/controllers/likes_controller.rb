class LikesController < ApplicationController
  def create
    unless current_user.already_like_this?(clicked_message)
      current_user.like_this(clicked_message)
      flash[:success] = '投稿に「いいね！」しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'すでに「いいね！」しています'
      redirect_back(fallback_location: root_path)
      # 「いいね！」削除ボタンを実装すると、↑上記の2行は不要になります
    end
  end

  private

  def clicked_message
    Message.find(params[:message_id])
  end

end
