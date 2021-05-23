class Isbn
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :number
  validates :number, isbn_format: true
end
