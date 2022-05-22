class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id#ここでエラーが起こりそう
  @book.save
  redirect_to '/users'
  end

  def edit
    #@book = Book.new(book_params)
    @book = Book.find(params[:id])
    #@book.save
    #redirect_to
  end

  def update
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/users'
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
