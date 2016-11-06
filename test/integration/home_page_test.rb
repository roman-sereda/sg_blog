require 'test_helper'

class HomePageTest < ActiveSupport::TestCase
  def setup
    signin(FactoryGirl.create(:user, :with_posts))
    visit "/"
  end

  def test_visit_home_page_and_see_blog_title
    assert page.has_content?("SG Blog")
  end

  def test_visit_home_page_and_see_five_posts
    assert_equal 5, page.all(".post").count
  end

  def test_navbar_buttons
    assert page.has_link?("Create Post"), "No create post link in navbar"
    click_link("Create Post")
    assert page.has_selector?(".new_post"), "Create Post link dont redirect"

    assert page.has_link?("Users"), "No users link in navbar"
    click_link("Users")
    assert page.has_selector?(".user-list"), "Users link dont redirect"

    assert page.has_link?("Account"), "No Account link in navbar"
    click_link("Account")
    assert page.has_content?("Profile"), "Account link dont show menu"
  end

  def test_Account_link_navbar
    click_link("Account")

    assert page.has_content?("Profile"), "No Profile link in account menu"
    assert page.has_content?("Setting"), "No Settings link in account menu"
    assert page.has_content?("Sign out"), "No Sign out link in account menu"

    click_link("Profile")
    assert page.has_selector?('.profile-left-bar'), "Profile link dont redirect"

    click_link("Settings")
    assert page.has_content?("Update your profile"), "Profile link dont redirect"

    click_link("Sign out")

  end
end
