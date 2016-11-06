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

  def test_there_is_a_button_create_post
    assert page.has_link?("Create Post")
  end
end
