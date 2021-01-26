require 'rails_helper'
require 'selenium-webdriver'

include RSpec::Expectations
describe "Calcs" do
  setup do
    @driver = Selenium::WebDriver.for :chrome
    @driver.get("http://localhost:3000")
  end

  teardown do
    @driver.quit
  end

  it "test_result" do
    @driver.find_element(:id, 'input-field').send_keys '1'
    @driver.find_element(:id, 'submit-but').click
    sleep 2
    assert @driver.find_element(:xpath, '//tr[2]/td[2]').text == '0'
    assert @driver.find_element(:xpath, '//tr[3]/td[2]').text == '1'
  end

  it "test_square" do
    @driver.find_element(:id, 'input-field').send_keys '100'
    @driver.find_element(:id, 'submit-but').click
    sleep 2
    numbers = @driver.find_elements(:xpath, '//tr/td[2]').map {|num| num.text.to_i}
    square = @driver.find_elements(:xpath, '//tr/td[3]').map {|num| num.text.to_i}
    numbers.each_with_index {|num, index| assert num*num == square[index] }
  end

  it "test_palindrome" do
    @driver.find_element(:id, 'input-field').send_keys '100'
    @driver.find_element(:id, 'submit-but').click
    sleep 2
    square = @driver.find_elements(:xpath, '//tr/td[3]').map {|num| num.text.to_i}
    square.each {|num| assert num == num.to_s.reverse.to_i }
  end

  it "test_input_error" do
    @driver.find_element(:id, 'input-field').send_keys 'str'
    @driver.find_element(:id, 'submit-but').click
    sleep 2
    assert @driver.find_element(:xpath, "//div[contains(@id, 'result')]//b").text == 'Ошибка ввода'
  end

end

