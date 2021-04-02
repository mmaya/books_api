class BookCopiesController < ApplicationController
  include BookIsbnSearch
  before_action :set_book_copy, only: [:show, :update, :destroy]

  # GET /book_copies
  def index
    @book_copy = BookCopy.all

    render json: @book_copy
  end

  # GET /book_copies/1
  def show
    render json: @book_copy
  end

  # POST /book_copies
  def create
    book = search_or_create_book_by_isbn(book_copy_params["isbn"])

    # The book must exists to persist a copie
    if book.save
      new_book_copy = book_copy_params.except(:isbn)
      new_book_copy[:book] = book

      @book_copy = BookCopy.create(new_book_copy)
      
      if @book_copy.save
        render json: @book_copy, status: :created, location: @book_copy
      else
        render json: @book_copy.errors, status: :unprocessable_entity
      end
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end



  # PATCH/PUT /books/1
  def update
    if @book_copy.update(book_copy_params)
      render json: @book_copy
    else
      render json: @book_copy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book_copy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book_copy = BookCopy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_copy_params
      params.permit(:isbn, :user_description, :is_new, :price, :cover_image)
    end
end
