require 'test_helper'

class CreatingCommentTest < ActiveSupport::TestCase
  def setup
    FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, :with_comment)
    visit "/posts/#{@post.id}"
  end

  def test_see_create_new_post_button
    assert page.has_content? "Please, login to comment this post"
  end

  def test_there_is_author_avatar
    assert page.has_selector?(".comment-image"), "User has no image in comment"
    assert page.has_selector?(".comment-created-at"), "User has no data in comment"
    assert page.has_selector?(".comment-user"), "User has no author in comment"
  end

end
