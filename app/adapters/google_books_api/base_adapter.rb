# This module is responsible for request the book information to Google Books API, 
# parse the response, and handle Google Books API errors.
# This is the focal point to address all API changes (Adapter design pattern)
module GoogleBooksApi
  require 'rest_client'
  class BaseAdapter
    cattr_accessor :base_url, :request

      self.base_url = ENV.fetch("GOOGLE_BOOKS_API_URL")

    def self.searchISBN(isbn)
      begin
        url = "#{self.base_url}?q=isbn+#{isbn}&key=#{Rails.application.credentials[:google_books]}"
        response = self.request = RestClient.get url 

        if response.code == 200
          parsed = JSON.parse(response)

          if parsed["items"] && parsed["items"].kind_of?(Array) && parsed["items"].length > 0
            book_data = {
              isbn: isbn,
              title: parsed["items"][0]["volumeInfo"]["title"],
              subtitle: parsed["items"][0]["volumeInfo"]["subtitle"],
              page_count: parsed["items"][0]["volumeInfo"]["pageCount"],
              publisher: parsed["items"][0]["volumeInfo"]["publisher"],
              edition: parsed["items"][0]["volumeInfo"]["edition"],
              published_date: parsed["items"][0]["volumeInfo"]["publishedDate"],
              language: parsed["items"][0]["volumeInfo"]["language"],
              description: parsed["items"][0]["volumeInfo"]["description"],
              info_url: parsed["items"][0]["volumeInfo"]["infoLink"],
              average_rating: parsed["items"][0]["volumeInfo"]["averageRating"],
              authors: parsed["items"][0]["volumeInfo"]["authors"],
            }
          end
        else
          raise GoogleBooksApi::Error.new(response.code, "")
        end
      rescue RestClient::ExceptionWithResponse => e
        raise GoogleBooksApi::Error.new(e.response.code, e)
      rescue StandardError => e
        raise GoogleBooksApi::Error.new("", e)
      end
    end
  end
end
  
  