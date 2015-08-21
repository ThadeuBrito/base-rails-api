# class RegistrationsController < ApplicationController
class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user_from_token!

  # POST /v1/auth
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {error: 'User not created'}, status: 500
    end
  end

  private
  def user_params
    body_params.permit(:email, :password, :password_confirmation)
  end

end
