require "test_helper"

class PostsShowPageTest < ActiveSupport::TestCase
  def setup
    create_test_post
    visit "/posts/1"
  end

  def test_there_is__post_body_on_page
    assert page.has_content? "testpost"
  end

  def test_there_is_post_title_on_page
    assert page.has_content? "abcdefghgklmnopqrstuvwxyzabcde
    fghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyzabcde
    fghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyzhgklmnopqrstuvwxyzabcde
    fghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyz"
  end

  def test_thre_is_edit_button_on_page
    assert page.has_button? "Edit post"
  end

  def test_threre_is_delete_button_on_page
    assert page.has_button? "Delete post"
  end

  def create_test_post
    Post.create title: "testpost", body: "abcdefghgklmnopqrstuvwxyzabcde
    fghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyzabcde
    fghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyzhgklmnopqrstuvwxyzabcde
    fghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyz"
  end

end
