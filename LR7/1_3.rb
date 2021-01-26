# frozen_string_literal: true

require_relative './1_1'
require 'test/unit'

# Class which test our program
class MyTest < Test::Unit::TestCase
  def test1_file
    if File.file?('./F.txt')
      assert_equal(Main.max_a, FuncTest.cal)
    else
      assert(false)
    end
  end
end

# Class with test functions
class FuncTest
  def self.cal
    words = File.open('./F.txt').read.split.select { |str| str.start_with?('a') }
    words.empty? ? 'No words found' : words.select { |str| str.length == words.max_by(&:length).length }.last
  end
end
