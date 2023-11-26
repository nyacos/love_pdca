require "application_system_test_case"

class ChecksTest < ApplicationSystemTestCase
  setup do
    @check = checks(:one)
  end

  test "visiting the index" do
    visit checks_url
    assert_selector "h1", text: "Checks"
  end

  test "should create check" do
    visit checks_url
    click_on "New check"

    fill_in "Content", with: @check.content
    fill_in "Title", with: @check.title
    click_on "Create Check"

    assert_text "Check was successfully created"
    click_on "Back"
  end

  test "should update Check" do
    visit check_url(@check)
    click_on "Edit this check", match: :first

    fill_in "Content", with: @check.content
    fill_in "Title", with: @check.title
    click_on "Update Check"

    assert_text "Check was successfully updated"
    click_on "Back"
  end

  test "should destroy Check" do
    visit check_url(@check)
    click_on "Destroy this check", match: :first

    assert_text "Check was successfully destroyed"
  end
end
