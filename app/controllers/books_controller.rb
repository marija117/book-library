class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_author
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @books = @author.books
  end

  def show
  end

  def new
  end

  def create
    @book = @author.books.build(book_params)

    if @book.save
      render json: @book, notice: 'Book was successfully created.'
    else
      render json: { errors: @book.errors }, status: 422 
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      render json: @book, notice: 'Book was successfully updated.'
    else
      render json: { errors: @book.errors }, status: 422 
    end
  end

  def destroy
    @book.destroy

    render json: @author
  end

  private

  def set_book
      @book = @author.books.find(params[:id]) if params[:id]
  end

  def get_author
      @author = Author.find(params[:author_id]) if params[:author_id]
  end

  def book_params
      params.require(:book).permit(:author_id, :title, :number_of_hard_copies)
  end
end
