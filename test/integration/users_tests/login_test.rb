require 'test_helper'

class LoginTest < ActiveSupport::TestCase

  def setup
    @user = FactoryGirl.create(:user)
    visit "/sessions/new"
  end

  def test_login_valid_new_user_and_get_success_message
    fill_in 'email-field', with: "#{@user.email}"
    fill_in 'password-field', with: "password"

    click_button "Sign in"

    assert page.has_selector?".profile-left-bar"
  end

  def test_login_invalid_new_user_and_get_error_message
    fill_in 'email-field', with: 'Person_1@gmail.com'
    fill_in 'password-field', with: 'testpasswword'

    click_button "Sign in"

    assert page.has_content?"Invalid email/password combination"
  end

end
