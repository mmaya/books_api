require 'swagger_helper'

RSpec.describe 'books', type: :request do

  path '/books' do

    get('list books') do
      tags 'Books'
      produces 'application/json'
      description "List all books from the local database."
      response(200, 'successful') do
        schema type: :object,
          properties: {
            isbn: { type: :string },
            title: { type: :string },
            subtitle: { type: :string },
            page_count: { type: :string },
            publisher: { type: :string },
            edition: { type: :string },
            published_date: { type: :string },
            language: { type: :string },
            description: { type: :string },
            info_url: { type: :string },
            average_rating: { type: :string },
            authors: { type: :array },
          },
          example: [
            {
            "title": "MALALA, A MENINA QUE QUERIA IR PARA A ESCOLA",
            "subtitle": "",
            "page_count": "96",
            "publisher": "",
            "edition": "",
            "published_date": "2015-04-30",
            "language": "pt",
            "description": "No primeiro livro-reportagem destinado ao público infantil, a jornalista Adriana Carranca relata às crianças a história da adolescente paquistanesa Malala Yousafzai, baleada por membros do Talibã aos catorze anos por defender a educação feminina. Na obra, a repórter traz suas percepções sobre o vale do Swat, a história da região e a definição dos termos mais importantes para entender a vida desta menina tão corajosa.",
            "info_url": "http://books.google.com.br/books?id=LqlHvgAACAAJ&dq=isbn+8574066702&hl=&source=gbs_api",
            "average_rating": "",
            "authors": [
              "ADRIANA CARRANCA CORRÊA"
            ],
            "isbn": "8574066702"
          }
          ]
        run_test!
      end
    end

    post('create book') do
      response(201, "successful") do
        tags "Books"
        consumes "application/json"
        description "Creates a new book on the local database by searching the provided ISBN10 on Google Books API. It shows a custom error if the ISBN10 doesn't exist on Google Books API database or if it exists but doesn't have yhe minimal requested data."
        parameter name: :isbn, in: :body, type: :string, required: true, example: {"isbn": "8574066702"}
        schema type: :object,
          properties: {
            isbn: { type: :string },
            title: { type: :string },
            subtitle: { type: :string },
            page_count: { type: :string },
            publisher: { type: :string },
            edition: { type: :string },
            published_date: { type: :string },
            language: { type: :string },
            description: { type: :string },
            info_url: { type: :string },
            average_rating: { type: :string },
            authors: { type: :array },
          },
          required: [ 'isbn'],
          example: {
            "title": "MALALA, A MENINA QUE QUERIA IR PARA A ESCOLA",
            "subtitle": "",
            "page_count": "96",
            "publisher": "",
            "edition": "",
            "published_date": "2015-04-30",
            "language": "pt",
            "description": "No primeiro livro-reportagem destinado ao público infantil, a jornalista Adriana Carranca relata às crianças a história da adolescente paquistanesa Malala Yousafzai, baleada por membros do Talibã aos catorze anos por defender a educação feminina. Na obra, a repórter traz suas percepções sobre o vale do Swat, a história da região e a definição dos termos mais importantes para entender a vida desta menina tão corajosa.",
            "info_url": "http://books.google.com.br/books?id=LqlHvgAACAAJ&dq=isbn+8574066702&hl=&source=gbs_api",
            "average_rating": "",
            "authors": [
              "ADRIANA CARRANCA CORRÊA"
            ],
            "isbn": "8574066702"
          }
        run_test!
      end
    end
  end
end
