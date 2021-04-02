class Book < ApplicationRecord
  require 'open-uri'
  has_many :book_copies

  validates :title, :isbn, :authors, presence: true

  def as_json(options={})
    super(
      :except => [:created_at, :updated_at, :id]
    )
  end
end
