class BookCopy < ApplicationRecord
  belongs_to :book
  has_one_attached :cover_image
  
  def as_json(options={})
    super.merge({book.to_json})
  end
end
