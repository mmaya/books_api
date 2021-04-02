module GoogleBooksApi
  require 'rest_client'
  class BaseAdapter
    cattr_accessor :base_url, :request

      self.base_url = ENV.fetch("GOOGLE_BOOKS_API_URL")

    def self.searchISBN(isbn)
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
      end
    end
  end
end
  