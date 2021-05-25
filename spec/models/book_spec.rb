require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    expect(build_stubbed(:book)).to be_valid
  end
  it "is not valid without a isbn" do
    expect(build_stubbed(:book, isbn: nil)).to_not be_valid
  end
  it "is not valid without a title" do
    expect(build_stubbed(:book, {title: nil})).to_not be_valid
  end
  it "is not valid without authors" do
    expect(build_stubbed(:book, {authors: nil})).to_not be_valid
  end
  it "is not valid without a valid isbn number" do
    expect(build_stubbed(:book, isbn: "568")).to_not be_valid
  end
end
