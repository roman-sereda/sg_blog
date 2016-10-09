require "test_helper"

class DeletePostTest < ActiveSupport::TestCase
  def setup
    Post.create title: "AAAAAAAAAA", body: "A"*200, image: File.open("public/uploads/post/test_images/1.jpg")
    visit "/posts/1"
  end

  def test_delete_post
    click_button("Delete post")
    assert !(page.has_selector? ".post-title")
  end
end
