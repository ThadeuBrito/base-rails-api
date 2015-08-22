class AuthsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:login, :register]

  def login
    @user = User.find_by(email: params[:email])
    if @user.valid_password?(user_params[:password])
      render json: {notice: "#{@user.email} logado", token: @user.access_token}, status: 200
    end
  end

  def register
    @email = user_params[:email]
    @user  = User.create(user_params)

    # render json: {notice: 'Regited'}, status: 500
  end

  def forgot
    render json: {notice: 'Regited'}, status: 500
  end

  def update
    render json: {notice: 'Regited'}, status: 500
  end

  private

  def user_params
    body_params.permit(:email, :password, :password_confirmation)
  end
end
