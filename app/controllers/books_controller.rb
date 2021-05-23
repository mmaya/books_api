class BooksController < ApplicationController
  include BookIsbnSearch
  before_action :set_isbn, only: [:create, :update, :showByIsbn]

  # GET /books
  def index
    @books = Book.all
    render json: @books
  end

  # GET /isbn/856240988X
  def showByIsbn
    @book = search_or_create_book_by_isbn(book_params["isbn"])

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # POST /books
  def create
    @book = search_or_create_book_by_isbn(book_params["isbn"])
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def book_params
      params.permit(:isbn)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_isbn
      @isbn = Isbn.new(number: book_params["isbn"])
      if @isbn.invalid? then render json: @isbn.errors, status: :unprocessable_entity end
    end
end
