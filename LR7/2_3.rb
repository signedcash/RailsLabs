# frozen_string_literal: true

require 'test/unit'
require_relative './2_1'

# Class for testing
class MyTest < Test::Unit::TestCase
  def test1_superclass
    person = Person.new('LastName', 18)
    sick = Sick.new('LastName', 18, 2020)
    assert(person.instance_of?(sick.class.superclass))
  end
end
