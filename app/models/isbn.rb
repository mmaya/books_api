# Abstraction to validates the ISBN.
# In this scenario, it could be implemented as a method on the Book model, 
# but in more complex situations using ActiveModels is very helpful to deal with many models and transactions.
class Isbn
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :number
  validates :number, isbn_format: true
end
