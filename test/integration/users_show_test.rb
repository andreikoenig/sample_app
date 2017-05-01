require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @activeuser = users(:andrei)
    @notactiveuser = users(:nonactive)
  end

  test "should redirect to rool url if access page of non activated user" do
    log_in_as @activeuser
    get user_path(@notactiveuser)
    assert_redirected_to root_url
  end
end
