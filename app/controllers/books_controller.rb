class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def show
  end
  
  def create
 
  end

  def edit
  end
  
    private
  
  def list_params
    params.require(:book).permit(:title, :body, :image)
  end

  
end
