class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def index
		@books = Book.all
    	@book = Book.new
    	@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@book_comment = BookComment.new
		@book_comments = @book.book_comments
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		redirect_to book_path(@book), notice: "You have creatad book successfully."
		else
		@books = Book.all
		@user = current_user
		render 'index'
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
	  	@book = Book.find(params[:id])
	  	@book.user_id = current_user.id
	  	if @book.update(book_params)
	  	redirect_to book_path(@book), notice: "You have updated book successfully."
	    else
	      render 'edit'
	    end
  	end

	def destroy
		@book = Book.find(params[:id])
	  	@book.destroy
	  	redirect_to books_path
  	end

  	private
  	def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  	end

  	def correct_user
  		@book = Book.find(params[:id])
  		unless current_user.id == @book.user_id then
  			redirect_to books_path
  		end
    end
end
