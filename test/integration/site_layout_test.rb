require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:andrei)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test "should redirect to login page when accessing user index if not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should display user index when logged in" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
  end


end
