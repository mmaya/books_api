# Abstraction to validates the ISBN.
# In this scenario, it could be implemented as a method on the Book model, 
# but in more complex situations using ActiveModels is very helpful to deal with many models and transactions.
class Isbn
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :number
  validates :number, isbn_format: true

  def search_or_create_book_by_isbn
    @book = Book.find_by(isbn: self.number)
    if !@book
      gbooks_data = GbooksIsbnService.new(self.number).execute
      @book = Book.create(gbooks_data)
    end
    @book
  end
end
