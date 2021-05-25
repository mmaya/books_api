FactoryBot.define do
  factory :book do
    isbn { "8574066702" }
    title { "MALALA, A MENINA QUE QUERIA IR PARA A ESCOLA" }
    authors { ["ADRIANA CARRANCA CORRÊA"] }
  end
  factory :book_copy do
    book factory: :book
    price { 50.00 }
    cover_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'test-image.jpg'), 'image/png') }
  end
end

