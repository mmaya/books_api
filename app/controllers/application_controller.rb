class ApplicationController < ActionController::API
  rescue_from ApiException, 
    with: :render_error_response

  # Handle all business third-party APIs errors 
  def render_error_response(error)
    render json: error, status: 200
  end
end
