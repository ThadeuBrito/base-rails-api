# class RegistrationsController < ApplicationController
class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user_from_token!

  # POST /v1/login
  # def create
  #
  #   user = User.new
  #   user.username              = params[:username]
  #   user.email                 = params[:email]
  #   user.password              = params[:password]
  #   user.password_confirmation = params[:password_confirmation]
  #
  #   if user.save!
  #     render json: user
  #   else
  #     render json: {error: t('User not created')}
  #   end
  # end

  def create
    super
  end

end
