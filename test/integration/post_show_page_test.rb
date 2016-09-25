require "test_helper"

class PostsShowPageTest < ActiveSupport::TestCase
  def setup
    Post.create title: "test_post_title", body: "test_post_body"
    visit "/page/id_1"
  end

  def test_there_is__post_body_on_page
    assert page.has_content? "test_post_title"
  end

  def test_there_is_post_title_on_page
    assert page.has_content? "test_post_body"
  end

  def test_thre_is_edit_button_on_page
    assert page.has_button? "Edit post"
  end

  def test_threre_is_delete_button_on_page
    assert page.has_button? "Delete post"
  end
end
