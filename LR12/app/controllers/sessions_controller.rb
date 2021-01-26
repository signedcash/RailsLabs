# frozen_string_literal: true

# Sessions Controller Class
class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new; end

  def create
    user = User.find_by_login(params[:login])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to input_url
    else
      flash[:alert] = 'invalid data'
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
