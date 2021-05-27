class BookCopiesController < ApplicationController
  before_action :set_isbn, only: [:create, :update]

  # GET /book_copies
  def index
    @book_copy = BookCopy.all

    render json: @book_copy
  end

  # POST /book_copies
  def create
    # The book must exists to persist a copy of it.  
    # It's not a transaction because my strategy is to have as many books as possible in my database
    # So, I want to persist the book, even if something goes wrong persisting the book copy.  
    if @book
      puts @book
      new_book_copy = book_copy_params.except(:isbn)
      new_book_copy[:book] = @book

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

  private
    # Only allow a list of trusted parameters through.
    def book_copy_params
      params.permit(:isbn, :user_description, :is_new, :price, :cover_image)
    end

    # Validates the given ISBN number before doing anything. 
    def set_isbn
      @isbn = Isbn.new(number: book_copy_params["isbn"])
      if @isbn.valid? 
        @book = @isbn.search_or_create_book_by_isbn
        if !@book.save
          render json: @book.errors, status: :unprocessable_entity 
        end
      else 
        render json: @isbn.errors, status: :unprocessable_entity 
      end
    end
end
