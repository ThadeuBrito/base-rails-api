class AuthsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:login, :register]

  def login
    @user = User.find_by(email: params[:email])
    if @user.valid_password?(user_params[:password])
      render json: {user: @user, current_user: current_user}, status: 200
    end
  end

  def register
    @user  = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def forgot
    render json: {notice: 'Regited', current_user: current_user}, status: 500
  end

  def update
    render json: {notice: 'Regited'}, status: 500
  end

  private

  def user_params
    body_params.permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
