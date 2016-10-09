require 'test_helper'

class WatchingPostTest < ActiveSupport::TestCase
  def setup
    Post.create title: "AAAAAAAAAA", body: "A"*200, image: File.open("public/uploads/post/test_images/1.jpg")
    visit "/posts/1"
  end

  def test_there_is_post_body_on_page
    assert page.has_selector? ".post-body"
  end

  def test_there_is_post_title_on_page
    assert page.has_selector? ".post-title"
  end

  def test_there_is_post_title_on_page
    assert page.has_selector? ".post-image"
  end

  def test_thre_is_edit_button_on_page
    assert page.has_button? "Edit post"
  end

  def test_threre_is_delete_button_on_page
    assert page.has_button? "Delete post"
  end

end
