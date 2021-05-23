  module BookIsbnSearch
    include ActiveSupport::Concern

    def search_or_create_book_by_isbn(isbn)
      @book = Book.find_by(isbn: isbn)
      if !@book
        gbooks_data = GbooksIsbnService.new(isbn).execute
        @book = Book.create(gbooks_data)
      end
      @book 
    end
  end