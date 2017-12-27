require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index,show" do
    get product_index,show_url
    assert_response :success
  end

end
