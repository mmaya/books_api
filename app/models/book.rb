class Book < ApplicationRecord
  require 'open-uri'
  has_many :book_copies

  validates :title, :isbn, :authors, presence: true
end
