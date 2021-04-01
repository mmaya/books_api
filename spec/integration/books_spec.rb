require 'swagger_helper'

RSpec.describe 'books', type: :request do

  path '/books' do

    get('list books') do
      tags 'Books'
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

    post('create book') do
      response(201, 'successful') do
        tags 'Books'
        consumes 'multipart/form-data'
        security [Bearer: {}]
        parameter name: :book, in: :formData, schema: {
          properties: {
            isbn: {type: :string},
            user_cover: {type: :file}
          },
          required: true,
          example: {"book":{"isbn": "856240988X"}},
        }        
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


  path '/books/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show book') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update book') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update book') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete book') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
