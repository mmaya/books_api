class ApiException < StandardError
  def initialize(msg)
    super(msg)
  end
end
