Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :books
  resources :book_copies
  get '/isbn/:isbn', to: 'books#showByIsbn'
end
