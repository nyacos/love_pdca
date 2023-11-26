require "application_system_test_case"

class DoosTest < ApplicationSystemTestCase
  setup do
    @doo = doos(:one)
  end

  test "visiting the index" do
    visit doos_url
    assert_selector "h1", text: "Doos"
  end

  test "should create doo" do
    visit doos_url
    click_on "New doo"

    fill_in "Content", with: @doo.content
    fill_in "Title", with: @doo.title
    click_on "Create Doo"

    assert_text "Doo was successfully created"
    click_on "Back"
  end

  test "should update Doo" do
    visit doo_url(@doo)
    click_on "Edit this doo", match: :first

    fill_in "Content", with: @doo.content
    fill_in "Title", with: @doo.title
    click_on "Update Doo"

    assert_text "Doo was successfully updated"
    click_on "Back"
  end

  test "should destroy Doo" do
    visit doo_url(@doo)
    click_on "Destroy this doo", match: :first

    assert_text "Doo was successfully destroyed"
  end
end
