class ApplicationController < ActionController::API
  def authenticate_user!
    UserService.authenticate(request)
  rescue StandardError
    render json: { error: 'You must provide a valid token' }, status: :unauthorized
  end
end
