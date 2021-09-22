require "application_system_test_case"

class ManegesTest < ApplicationSystemTestCase
  setup do
    @manege = maneges(:one)
  end

  test "visiting the index" do
    visit maneges_url
    assert_selector "h1", text: "Maneges"
  end

  test "creating a Manege" do
    visit maneges_url
    click_on "New Manege"

    fill_in "Name", with: @manege.name
    fill_in "Post", with: @manege.post
    click_on "Create Manege"

    assert_text "Manege was successfully created"
    click_on "Back"
  end

  test "updating a Manege" do
    visit maneges_url
    click_on "Edit", match: :first

    fill_in "Name", with: @manege.name
    fill_in "Post", with: @manege.post
    click_on "Update Manege"

    assert_text "Manege was successfully updated"
    click_on "Back"
  end

  test "destroying a Manege" do
    visit maneges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Manege was successfully destroyed"
  end
end
