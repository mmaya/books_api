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
          required: [ 'isbn', 'title', 'description' ],
          example: [
            {
              "id": 1,
              "title": "The Little Prince",
              "subtitle": "",
              "page_count": "128",
              "publisher": "Samaira Book Publishers",
              "edition": "",
              "published_date": "2017-11-04",
              "language": "en",
              "description": "",
              "info_url": "https://play.google.com/store/books/details?id=6948DwAAQBAJ&source=gbs_api",
              "average_rating": "5",
              "authors": [
                "Antoine de Saint-Exupéry",
                "SBP Editors"
              ],
              "isbn": "8193540190",
              "created_at": "2021-04-01T19:55:55.291Z",
              "updated_at": "2021-04-01T19:55:55.291Z"
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
        parameter name: :cover_image, :in => :formData, :type => :file, required: true
        parameter name: :isbn, :in => :formData, :type => :string, required: true
        
        schema type: :object,
        properties: {
          isbn: {type: :string},
          price: {type: :float},
          is_new: {type: :boolean},
          cover_image: {type: :file}
        },
        required: [ 'isbn', 'title', 'description' ],
          example: {
            isbn: "89885545",
            title: "O Pequeno Príncipe",
            subtitle: "",
            page_count: "232",
            publisher: "Editora Aurora",
            edition: "10ª edição",
            published_date: "2020-09-02",
            language: "Português",
            small_thumbnail_url: "",
            thumbnail_url: "",
            description: '"O essencial é invisível aos olhos ..." O Pequeno Príncipe é uma das obras literárias mais lidas no mundo e isto se deve à sua capacidade de relevar, a cada pessoa, significados diferentes, profundos, diante de uma história aparentemente simples. Nesta nova edição, você terá a chance de revisitar asteroides, planetas e baobás, encontrar uma certa raposa e admirar uma rosa muito especial. Escrito há mais de 70 anos, este livro é um dos favoritos de todos os apaixonados por literatura. E, até quem não tem hábito de leitura, se encanta pela doçura do pequeno príncipe. Ilustrado com as aquarelas do autor, a obra narra a amizade entre um piloto perdido no deserto e seu amigo inesperado, o pequeno príncipe. Seja esta a sua primeira leitura ou já perdeu as contas de quantas vezes leu a história: prepare-se para se emocionar.',
            info_url: "http://books.google.com.br/books?id=Hx_PzQEACAAJ&dq=isbn+658604104X&hl=&source=gbs_api",
            average_rating: "5.0",
            authors: ["Antoine De Saint - Exupéry"],
          }
        run_test!
      end
    end
  end
end
