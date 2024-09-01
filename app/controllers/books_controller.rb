class BooksController < ApplicationController
  def index
    @books = Book.order(:id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new()
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book created successfully."
      redirect_to books_path
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Book.count
      flash[:notice] = "Fields can't be blank."
      redirect_to new_book_path
      
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book updated successfully."
      redirect_to book_path(@book)
    else
      render('edit')
    end 
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book deleted successfully."
    redirect_to books_path
  end

  private 

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :price,
      :published
    )
  end
end
