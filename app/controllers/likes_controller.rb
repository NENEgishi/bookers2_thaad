class LikesController < ApplicationController
  def index
    @like_topics = current_user.like_book
  end

  def create
    like = Like.new #Likeクラスのインスタンスを作成
    like.user_id = current_user.id #current_userのidを変数に代入
    like.book_id = params[:book_id]

    if like.save #likeが保存できているかどうかで条件分岐
      redirect_to books_path, success: 'いいねしました'
    else
      redirect_to books_path, danger: 'いいねに失敗しました'
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, book_id: params[:book_id])
    @like.destroy
    redirect_to books_path, success: 'いいねを取り消しました'
  end
end
