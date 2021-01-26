# frozen_string_literal: true

# Class Result
class Result < ApplicationRecord
  validates :request, uniqueness: true

  class << self
    def compute(request)
      (request + 1).times.filter do |i|
        square = (i**2).to_s
        square == square.reverse
      end
    end

    def create_or_get_by_request(request)
      res = find_by(request: data)
      return res unless res.nil?

      create(request: request, response: Result.compute(request))
    end
  end

  def response
    ActiveSupport::JSON.decode(super)
  end

  def response=(value)
    super(ActiveSupport::JSON.encode(value))
  end
end
