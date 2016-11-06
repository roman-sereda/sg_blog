require "test_helper"

class PostTest < ActiveSupport::TestCase

  def setup
    @post = FactoryGirl.create(:post)
  end

  def test_posts_atrributes_exists
    assert @post.respond_to?(:title), "Post.title doesnt exists"
    assert @post.respond_to?(:body), "Post.body doesnt exists"
  end

  def test_posts_title_validation
    assert_not @post.update_attributes(title: "test"), "Post.title less than 5 created"
    assert_not @post.update_attributes(title: "test"*30), "Post.title more than 100 created"
    assert_not @post.update_attributes(title: ""), "Post.title empty created"
  end

  def test_posts_body_validation
    assert_not @post.update_attributes(body: "test"*30), "Post.body less than 200 created"
    assert_not @post.update_attributes(body: ""), "Post.body empty created"
  end

end
