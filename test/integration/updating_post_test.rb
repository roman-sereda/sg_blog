require "test_helper"

class UpdatingPostTest < ActiveSupport::TestCase
  def setup
    Post.create title: "AAAAAAAAAA", body: "A"*200, image: File.open("public/uploads/post/test_images/1.jpg")
    visit "/posts/1"
  end

  def test_edit_title_post
    click_button "Edit post"
    fill_in 'title-field', with: 'testpost2'
    click_button "Update post"
    assert page.has_content?"testpost2"
  end

  def test_body_title_post
    click_button "Edit post"
    fill_in 'body-field', with: 'testbody Washington, D.C., formally
    the District of Columbia and commonly referred to as "Washington",
    "the District", or simply "D.C.", is the capital of the United States.
    The signing of the Residence Act on July 16, 1790, approved the creation
    of a capital district located along the Potomac River on the countrys
    East Coast.'
    click_button "Update post"
    assert page.has_content?"testbody"
  end

  def test_delete_image_from_post
    click_button "Edit post"
    find(:css, ".checkbox-image").set(true)
    click_button "Update post"
    assert !page.has_selector?("post-image")
  end
end
