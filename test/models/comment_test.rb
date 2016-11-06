require "test_helper"

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = FactoryGirl.create(:comment)
  end

  def test_comments_atrributes_exists
    assert @comment.respond_to?(:body), "Comment.body doesnt exists"
  end

  def test_comments_body_validation
    assert_not @comment.update_attributes(body: "t"), "Comment.body less than 1 created"
    assert_not @comment.update_attributes(body: "test"*100), "Comment.body more than 100 created"
    assert_not @comment.update_attributes(body: "First post"), "Comment.body first post created"
    assert_not @comment.update_attributes(body: "http://google.com"), "Comment.body link created"
  end

end
