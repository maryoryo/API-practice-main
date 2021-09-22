require 'test_helper'

class ManegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manege = maneges(:one)
  end

  test "should get index" do
    get maneges_url
    assert_response :success
  end

  test "should get new" do
    get new_manege_url
    assert_response :success
  end

  test "should create manege" do
    assert_difference('Manege.count') do
      post maneges_url, params: { manege: { name: @manege.name, post: @manege.post } }
    end

    assert_redirected_to manege_url(Manege.last)
  end

  test "should show manege" do
    get manege_url(@manege)
    assert_response :success
  end

  test "should get edit" do
    get edit_manege_url(@manege)
    assert_response :success
  end

  test "should update manege" do
    patch manege_url(@manege), params: { manege: { name: @manege.name, post: @manege.post } }
    assert_redirected_to manege_url(@manege)
  end

  test "should destroy manege" do
    assert_difference('Manege.count', -1) do
      delete manege_url(@manege)
    end

    assert_redirected_to maneges_url
  end
end
