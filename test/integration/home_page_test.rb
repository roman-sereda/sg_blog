require "test_helper"

class HamePageTest < ActiveSupport::TestCase
  def setup
    create_ten_posts
    visit "/"
  end

  def test_visit_home_page_and_see_blog_title
    assert page.has_content?("SG Blog")
  end

  def test_visit_home_page_and_see_ten_post_titles
    create_ten_posts
    assert_equal 10, page.all(".post-all").count
  end

  def test_visit_other_page_by_link
    assert page.has_link?("testpost")
  end

  def test_there_is_a_button_create_post
    assert page.has_link?("Create Post")
  end

  def create_ten_posts
     10.times { Post.create title: "testpost", body: 'Washington, D.C., formally
        the District of Columbia and commonly referred to as "Washington",
        "the District", or simply "D.C.", is the capital of the United States.
        The signing of the Residence Act on July 16, 1790, approved the creation
        of a capital district located along the Potomac River on the countrys
        East Coast.' }
  end
end
