require 'rails_helper'

RSpec.describe BookCopy, type: :model do
  it "is valid with valid attributes" do
    expect(build_stubbed(:book_copy)).to be_valid
  end
  it "is not valid without a price" do
    expect(build_stubbed(:book_copy, {price: nil})).to_not be_valid
  end
  it "is not valid without a cover image" do
    expect(build_stubbed(:book_copy, {cover_image: nil})).to_not be_valid
  end
end
