require "application_system_test_case"

class QuizesTest < ApplicationSystemTestCase
  setup do
    @quize = quizes(:one)
  end

  test "visiting the index" do
    visit quizes_url
    assert_selector "h1", text: "Quizes"
  end

  test "should create quize" do
    visit quizes_url
    click_on "New quize"

    fill_in "Content", with: @quize.content
    fill_in "Status", with: @quize.status
    fill_in "Title", with: @quize.title
    click_on "Create Quize"

    assert_text "Quize was successfully created"
    click_on "Back"
  end

  test "should update Quize" do
    visit quize_url(@quize)
    click_on "Edit this quize", match: :first

    fill_in "Content", with: @quize.content
    fill_in "Status", with: @quize.status
    fill_in "Title", with: @quize.title
    click_on "Update Quize"

    assert_text "Quize was successfully updated"
    click_on "Back"
  end

  test "should destroy Quize" do
    visit quize_url(@quize)
    click_on "Destroy this quize", match: :first

    assert_text "Quize was successfully destroyed"
  end
end
