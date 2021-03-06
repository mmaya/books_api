require 'swagger_helper'

RSpec.describe 'book copies', type: :request do

  path '/book_copies' do

    get('list book copies') do
      tags 'Book copies'
      produces 'application/json'
      
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
            small_thumbnail_url: { type: :string },
            thumbnail_url: { type: :string },
            description: { type: :string },
            info_url: { type: :string },
            average_rating: { type: :string },
            authors: { type: :array },
          },
          description: "List all book copies",
          example:
          [
            {
              "id": "1563cd76-e68f-4b38-8e6a-0a502692c5f0",
              "user_description": "",
              "is_new": "",
              "price": "",
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
              "isbn": "8574066702",
              "cover_image_url": "https://book-images-dev.s3.sa-east-1.amazonaws.com/rh2cgf9ir1zdti0x7m1461kv58cz?response-content-disposition=inline%3B%20filename%3D%2271fcsbZKaGL._AC_UL200_SR200%252C200_.jpg%22%3B%20filename%2A%3DUTF-8%27%2771fcsbZKaGL._AC_UL200_SR200%252C200_.jpg&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA4QSR7Y5ZGYR5A65J%2F20210402%2Fsa-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210402T192046Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=bc90ab95e1110571366f1be0882e2360b375043d8b712fe5ca195835873808a4"
            }
          ]
        run_test!
      end
    end

    post('create book copy') do
      tags 'Book copies'
      produces 'application/json'
      
      response(201, 'successful') do
        consumes 'multipart/form-data'
        parameter name: :cover_image, in: :formData, type: :file, required: true
        parameter name: :isbn, in: :formData, type: :string, required: true, example: "8574066702"
        parameter name: :price, in: :formData, type: :number, required: true, example: "100.00"
        parameter name: :user_description, in: :formData, type: :string, required: false, example: "The book copy is in excellent state, it looks like new!"
        parameter name: :is_new, in: :formData, type: :boolean, required: false, default: false, example: "false"
        schema type: :object,
        description: "Creates a book copy for sale. It consumes the Google Book API if the books still don't exist on the local database. The book cover image, uploaded by the user, is hosted on AWS S3.",
        properties: {
          isbn: {type: :string},
          price: {type: :float},
          is_new: {type: :boolean},
          cover_image: {type: :file}
        },
        required: [ 'isbn', 'price' ],
          example: {
            "id": "1563cd76-e68f-4b38-8e6a-0a502692c5f0",
            "user_description": "",
            "is_new": "",
            "price": "",
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
            "isbn": "8574066702",
            "cover_image_url": "https://book-images-dev.s3.sa-east-1.amazonaws.com/rh2cgf9ir1zdti0x7m1461kv58cz?response-content-disposition=inline%3B%20filename%3D%2271fcsbZKaGL._AC_UL200_SR200%252C200_.jpg%22%3B%20filename%2A%3DUTF-8%27%2771fcsbZKaGL._AC_UL200_SR200%252C200_.jpg&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA4QSR7Y5ZGYR5A65J%2F20210402%2Fsa-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210402T192046Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=bc90ab95e1110571366f1be0882e2360b375043d8b712fe5ca195835873808a4"
          }
        run_test!
      end
    end
  end
end
