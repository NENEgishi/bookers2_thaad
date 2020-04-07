class CommentsController < ApplicationController
  def create
  	book = Book.find(params[:book_id])
    comment = current_user.comment.new(comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to books_path(book)
  end

  private
  def comment_params
  	params.require(:comment).permit(:book_id)
  end
end
