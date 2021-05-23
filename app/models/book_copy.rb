class BookCopy < ApplicationRecord
  belongs_to :book
  has_one_attached :cover_image

  validates :price, :cover_image, presence: {message: "Ooops, you need to provide a price and a cover image" }
  
  def as_json(options={})
  super(
    :except => [:created_at, :updated_at, :book_id]
  ).merge(self.book.as_json, {cover_image_url: self.cover_image.url})
  end
end
