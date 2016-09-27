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
    assert page.has_content? 'Washington, D.C., formally
    the District of Columbia and commonly referred to as "Washington",
    "the District", or simply "D.C.", is the capital of the United States.
    The signing of the Residence Act on July 16, 1790, approved the creation
    of a capital district located along the Potomac River on the countrys
    East Coast.'
  end

  def test_thre_is_edit_button_on_page
    assert page.has_button? "Edit post"
  end

  def test_threre_is_delete_button_on_page
    assert page.has_button? "Delete post"
  end

  def create_test_post
    Post.create title: "testpost", body: 'Washington, D.C., formally
    the District of Columbia and commonly referred to as "Washington",
    "the District", or simply "D.C.", is the capital of the United States.
    The signing of the Residence Act on July 16, 1790, approved the creation
    of a capital district located along the Potomac River on the countrys
    East Coast.'
  end

end
