#This service is a facade to encapsulate all the calls to the adapter. 
# This solution improves the maintainability of the code because creates a unique point to be modified if the adapter changes. 
# This is very important especially in this case since there is a third party involved (Google Books API).  

class GbooksIsbnService
  def initialize (isbn)
    @isbn = isbn
  end

  # The generic method insure the autonomy of this service, note that there is no business logic for the rest of the app here. 
  # This ensure the unilateral flux of information: controller knows only the service logic, which knows only the adapter logic,
  # that knows only the API logic (chain of responsibility design pattern). 
  def execute
    search
  end

  private
  
  def search
    book_data = GoogleBooksApi::BaseAdapter.searchISBN(@isbn)
  end 
  
end
