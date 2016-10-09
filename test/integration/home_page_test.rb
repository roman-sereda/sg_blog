require "test_helper"

class HomePageTest < ActiveSupport::TestCase
  def setup
    5.times {Post.create title: "AAAAAAAAAA", body: "A"*200, image: File.open("public/uploads/post/test_images/1.jpg")}
    visit "/"
  end

  def test_visit_home_page_and_see_blog_title
    assert page.has_content?("SG Blog")
  end

  def test_visit_home_page_and_see_five_posts
    assert_equal 5, page.all(".post-all").count
  end

  def test_there_is_a_button_create_post
    assert page.has_link?("Create Post")
  end
end
