require './test/test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get input_url
    assert_response :success
  end

  test "should get output" do
    get output_url, :params => { :txt => '1' }
    assert_response :success
  end

  test 'rss request' do
    get output_url, :params => { :txt => '10', :format => :rss }
    assert response.body.include?('<?xml version="')
  end

  test 'different requests should return different responses' do
    get output_url, :params => { :txt => '10' }
    res1 = response.body 
    get output_url, :params => { :txt => '100' }
    res2 = response.body
    assert_not_equal res1, res2 
  end

end
