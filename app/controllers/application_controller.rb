class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  before_action :authenticate_user_from_token!

  def body_params
    body_params = ActionController::Parameters.new(request.request_parameters)
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  # User Authentication
  # Authenticates the user with OAuth2 Resource Owner Password Credentials Grant
  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']

    if auth_token
      authenticate_with_auth_token auth_token
    else
      authentication_error
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: {nothing: true}, status: 403 #forbidden
  end

  private

  def current_user
    User.find_by_access_token(request.headers['Authorization'])
  end

  def authenticate_with_auth_token auth_token
    user = User.find_by_access_token(auth_token)
    authentication_error unless user
  end

  # Authentication Failure
  # Renders a 401 error
  def authentication_error
    # User's token is either invalid or not in the right format
    render json: {error: 'unauthorized'}, status: 401  # Authentication timeout
  end
end
