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
  end 
  
end
