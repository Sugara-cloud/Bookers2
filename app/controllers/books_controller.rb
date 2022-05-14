class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @books = Book.all
  end
  
  def show
  end
  
  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
