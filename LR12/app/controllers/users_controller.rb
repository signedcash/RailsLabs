# frozen_string_literal: true

# Users Controller Class
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to input_url
    else
      flash[:alert] = 'invalid data'
      redirect_to signup_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end
