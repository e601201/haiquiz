require "test_helper"

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get faqs" do
    get staticpages_faqs_url
    assert_response :success
  end

  test "should get about" do
    get staticpages_about_url
    assert_response :success
  end
end
