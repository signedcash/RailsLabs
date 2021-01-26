# frozen_string_literal: true

# Home Controller Class
class HomeController < ApplicationController
  before_action :check_params, only: %(output)

  def input; end

  def output
    @result = (params[:txt].to_i + 1).times.filter do |i|
      square = (i**2).to_s
      square == square.reverse
    end
  end

  protected

  def check_params
    render :output unless Integer(params[:txt], exception: false)
  end
end
