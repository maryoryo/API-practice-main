require "application_system_test_case"

class MailsTest < ApplicationSystemTestCase
  setup do
    @mail = mails(:one)
  end

  test "visiting the index" do
    visit mails_url
    assert_selector "h1", text: "Mails"
  end

  test "creating a Mail" do
    visit mails_url
    click_on "New Mail"

    fill_in "Name", with: @mail.name
    fill_in "Post", with: @mail.post
    click_on "Create Mail"

    assert_text "Mail was successfully created"
    click_on "Back"
  end

  test "updating a Mail" do
    visit mails_url
    click_on "Edit", match: :first

    fill_in "Name", with: @mail.name
    fill_in "Post", with: @mail.post
    click_on "Update Mail"

    assert_text "Mail was successfully updated"
    click_on "Back"
  end

  test "destroying a Mail" do
    visit mails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mail was successfully destroyed"
  end
end
