module GoogleBooksApi
  class Error < ApiException
    def initialize(msg)
      super(msg)
    end
  end
end