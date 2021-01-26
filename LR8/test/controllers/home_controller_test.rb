require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get output" do
    get output_url
    assert_response :success
  end

  test "should get input" do
    get input_url
    assert_response :success
  end

  test 'should get 12' do
    get output_url, params: { txt: '12'}
    assert_equal assigns[:arr], [0, 1, 2, 3, 11]
  end

  test 'should get 4' do
    get output_url, params: { txt: '4'}
    assert_equal assigns[:arr], [0, 1, 2, 3]
  end

  test 'should get 100' do
    get output_url, params: { txt: '100'}
    assert_equal assigns[:arr], [0, 1, 2, 3, 11, 22, 26]
  end

end
