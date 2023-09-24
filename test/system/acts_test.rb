require "application_system_test_case"

class ActsTest < ApplicationSystemTestCase
  setup do
    @act = acts(:one)
  end

  test "visiting the index" do
    visit acts_url
    assert_selector "h1", text: "Acts"
  end

  test "should create act" do
    visit acts_url
    click_on "New act"

    fill_in "Body", with: @act.body
    fill_in "Title", with: @act.title
    click_on "Create Act"

    assert_text "Act was successfully created"
    click_on "Back"
  end

  test "should update Act" do
    visit act_url(@act)
    click_on "Edit this act", match: :first

    fill_in "Body", with: @act.body
    fill_in "Title", with: @act.title
    click_on "Update Act"

    assert_text "Act was successfully updated"
    click_on "Back"
  end

  test "should destroy Act" do
    visit act_url(@act)
    click_on "Destroy this act", match: :first

    assert_text "Act was successfully destroyed"
  end
end
