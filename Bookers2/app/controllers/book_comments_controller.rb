class BookCommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :correct_user, only: [:destroy]
	def create
		book = Book.find(params[:book_id])
		@book_comment = book.book_comments.build(book_comment_params)
		# @book_comment = BookComment.new(book_comment_params)
		# @book_comment.book_id = book.id
		@book_comment.user_id = current_user.id
    	if @book_comment.save
    	redirect_back(fallback_location: root_path)
    	else
    	redirect_back(fallback_location: root_path)
    	end
	end

	def destroy
		@book_comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end

	def correct_user
    @book_comment = current_user.book_comments.find_by(id: params[:id])
    unless @book_comment
      redirect_to books_path
    end
  end
end
