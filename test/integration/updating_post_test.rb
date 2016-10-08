require "test_helper"

class PostsShowPageTest < ActiveSupport::TestCase
  def setup
    create_post
    visit "posts/1"
  end

  def test_edit_title_post

    click_button "Edit post"
    fill_in 'title_field', with: 'testpost2'
    click_button "Update post"
    assert page.has_content?"testpost2"

  end

  def test_body_title_post

    click_button "Edit post"
    fill_in 'body_field', with: 'testbody Washington, D.C., formally
    the District of Columbia and commonly referred to as "Washington",
    "the District", or simply "D.C.", is the capital of the United States.
    The signing of the Residence Act on July 16, 1790, approved the creation
    of a capital district located along the Potomac River on the countrys
    East Coast.'
    click_button "Update post"
    assert page.has_content?"testbody"

  end

  def create_post
    Post.create title: "testpost", body: 'Washington, D.C., formally
    the District of Columbia and commonly referred to as "Washington",
    "the District", or simply "D.C.", is the capital of the United States.
    The signing of the Residence Act on July 16, 1790, approved the creation
    of a capital district located along the Potomac River on the countrys
    East Coast.'
  end

end
