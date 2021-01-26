# frozen_string_literal: true

# HomeController
class HomeController < ApplicationController
  before_action :check_params, only: %(output)

  def input; end

  def output
    @result = (params[:txt].to_i + 1).times.filter do |i|
      square = (i**2).to_s
      square == square.reverse
    end
    render xml: convert_to_xml(@result)
  end

  # rubocop:disable Metrics/MethodLength
  def convert_to_xml(arr)
    Nokogiri::XML::Builder.new do
      result do
        arr&.each_with_index do |elem, i|
          element do
            index i + 1
            value elem
            square elem * elem
          end
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  protected

  def check_params
    render :output unless Integer(params[:txt], exception: false)
  end
end
