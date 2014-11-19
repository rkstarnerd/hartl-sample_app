require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert alert-danger'
    assert_not flash.success
  end
end
