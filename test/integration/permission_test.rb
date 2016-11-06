require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  def setup
    FactoryGirl.create(:user, :with_posts)
    visit "/"
  end

  def test_unloged_user_cannot_see_edit_delete_post_button
    visit "/posts/1"
    assert_not page.has_content?("Edit"), "Unloged user see Edit button"
    assert_not page.has_content?("Delete"), "Unloged user see Delete button"


  end

  def test_user_cannot_change_other_user_post
    signin(FactoryGirl.create(:user, :with_posts))
    visit "/posts/1"
    assert_not page.has_content?("Edit"), "Other user see Edit button"
    assert_not page.has_content?("Delete"), "Other user see Delete button"

    visit "/posts/1/edit?"
    fill_in 'title-field', with: 'Washington, D.C.'
    click_button("Update post")
    assert page.has_content?("You dont have permission to do it!")
  end

  def test_user_cannot_delete_another_user
    signin(FactoryGirl.create(:user, :with_posts))
    visit "/users"
    assert_not page.has_content?("delete"), "User can delete another user"
  end



end
