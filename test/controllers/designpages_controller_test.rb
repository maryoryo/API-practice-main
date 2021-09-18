require 'test_helper'

class DesignpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get designpages_index_url
    assert_response :success
  end

  test "should get show" do
    get designpages_show_url
    assert_response :success
  end

end
