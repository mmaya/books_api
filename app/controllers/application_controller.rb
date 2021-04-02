class ApplicationController < ActionController::API
  rescue_from ApiException, 
    with: :render_error_response


  def render_error_response(error)
    render json: error, status: 200
  end
end
