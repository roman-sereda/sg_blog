require 'test_helper'

class EditProfileTest < ActiveSupport::TestCase

  def setup
    @user = FactoryGirl.create :user
    signin(@user)
    visit "/users/#{@user.id}/edit"
  end

  def test_update_profile_name

    fill_in 'name-field', with: "edited"
    fill_in 'email-field', with: "#{@user.email}"
    fill_in 'password-field', with: "#{@user.password}"
    fill_in 'password-c-field', with: "#{@user.password}"

    click_button "Save changes"

    assert page.has_content?("edited")
  end
end
