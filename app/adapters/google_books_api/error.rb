# Handles third-party API errors
module GoogleBooksApi
  class Error < ApiException
    def initialize(status, error)
      case status
      when 503
        super("Ooops, we don't have this book on our database and Google Books API is unavaible, please try again later. #{error}")
      when 401
        super("Ooops, we don't have this book on our database and our Google Books API quota is out for today, please try again tomorrow. #{error}")
      else
        super("Ooops, we don't have this book on our database and something went wrong with Google Books API, please try again later. #{error}")
      end
    end
  end
end