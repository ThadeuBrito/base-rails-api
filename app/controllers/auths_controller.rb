class AuthsController < ApplicationController
  # skip_before_action :authenticate_user_from_token!, only: [:login, :register]

  def login
    # @user = User.find_by(email: params[:email])
    # return invalid_login_attempt unless @user
    #
    # if @user.valid_password?(params[:password])
    #   sign_in :user, @user
    #   render json: @user, serializer: SessionSerializer, root: nil
    # else
    #   invalid_login_attempt
    # end
    render json: {notice: 'logado'}, status: 500
  end

  def register
    @email = user_params[:email]
    @user  = User.create(user_params)
    # @user  = User.find_by_email(@email)
    # if @user
    #   render json: {notice: 'email already used'}
    # else



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
