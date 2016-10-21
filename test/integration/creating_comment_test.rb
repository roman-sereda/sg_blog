require "test_helper"

class CreatingCommentTest < ActiveSupport::TestCase
  def setup
    Post.create title: "AAAAAAAAAA", body: "A"*200, image: File.open("public/uploads/post/test_images/1.jpg")
    visit "/posts/1"
  end

  def test_see_create_new_post_button
    assert page.has_button?"Create new comment"
  end

  def test_create_post_and_watch_body
    fill_in 'comment-area', with: "test-comment"
    click_button "Create new comment"

    assert page.has_selector?".comment-body"
    assert page.has_content?"test-comment"
  end

  def test_comment_counter
    assert page.has_content?"Comments: 0"

    fill_in 'comment-area', with: "test-comment"
    click_button "Create new comment"

    assert page.has_content?"Comments: 1"
  end

  def test_fill_with_less_then_two_symbols
    fill_in 'comment-area', with: "a"
    click_button "Create new comment"
    assert page.has_selector?"#error"
  end
end
