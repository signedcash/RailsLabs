# frozen_string_literal: true

# Main Class
class Main
  def self.max_a
    words = File.open('./F.txt').read.split.select { |str| str.start_with?('a') }
    words.empty? ? 'No words found' : words.select { |str| str.length == words.max_by(&:length).length }.last
  end
end
