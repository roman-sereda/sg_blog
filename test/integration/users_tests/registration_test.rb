require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase

  def setup
    visit "/users/new"
  end

  def test_registration_valid_new_user_and_get_success_message
    fill_in 'name-field', with: 'testname'
    fill_in 'email-field', with: 'testemail@test.email'
    fill_in 'password-field', with: 'testpassword'
    fill_in 'password-c-field', with: 'testpassword'

    click_button "Create my account"

    assert page.has_content?"Profile Created"
  end

  def test_registration_invalid_new_user_and_get_error_message
    fill_in 'name-field', with: 'teme'
    fill_in 'email-field', with: 'testemail@testemail'
    fill_in 'password-field', with: 'testpasrd'
    fill_in 'password-c-field', with: 'testpassword'

    click_button "Create my account"

    assert page.has_selector?"#error_explanation"
  end

end
