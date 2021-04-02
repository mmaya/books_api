class GbooksIsbnService
  def initialize (isbn)
    @isbn = isbn
  end

  def execute
    search
  end

  private
  
  def search
    book_data = GoogleBooksApi::BaseAdapter.searchISBN(@isbn)
    puts '--------------'
    puts book_data
    puts '--------------'
    if book_data && book_data[:title] && book_data[:isbn] && book_data[:authors]
      book_data
    else
      raise  GoogleBooksApi::Error.new("Ooops, we don't have this book on our database and couldn't find either the complete book information with this ISBN on Google Books API")
    end
  end 
  
end
