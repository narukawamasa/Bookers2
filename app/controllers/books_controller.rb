class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
    @user = User.find(@books.user_id)
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
     redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to "/books"
  end

    private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
