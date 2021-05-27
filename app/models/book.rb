class Book < ApplicationRecord
  has_many :book_copies
  validates :isbn,   isbn_format: true
  # Although the information is from the Google Books API, It's not a third-party API error, is a business error of the application
  validates :title, :isbn, :authors, presence: {message: "Ooops, we don't have this book on our database and couldn't find either the complete book information with this ISBN on Google Books API" }

  def as_json(options={})
    super(
      :except => [:created_at, :updated_at, :id]
    )
  end
end
