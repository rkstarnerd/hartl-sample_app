require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

   test "layout links" do
    get root_path
    assert_template 'static_pages/home'

    get signup_path
    assert_template 'users/new'
    assert_select "title", full_title("Sign up")

    get help_path
    assert_template 'help'

    get about_path
    assert_template 'about'

    get contact_path
    assert_template 'contact'

    assert_select "a[href=?]", root_path, count: 2
  end
end
