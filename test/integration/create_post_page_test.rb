require "test_helper"

class CreatePostPageTest < ActiveSupport::TestCase

  def setup
    visit "/posts/new"
  end

  def test_is_there_create_button
    assert page.has_button? "Create new post"
  end

  def test_see_the_error_message
    click_button "Create new post"
    assert page.has_content? "You entered wrong data"
  end

  def test_enter_true_data_and_see_created_post

    fill_in("title_field", with: "The_unique_title")
    fill_in("body_field", with: 'Washington, D.C., formally the District of
  Columbia and commonly referred to as "Washington", "the District", or
   simply "D.C.", is the capital of the United States. The signing of the
   Residence Act on July 16, 1790, approved the creation of a capital
   district located along the Potomac River on the countrys East Coast.')
    click_button "Create new post"
    assert page.has_content? "The_unique_title"

  end

  def test_enter_wrong_title_and_see_error_message

    fill_in("title_field", with: "aw")
    fill_in("body_field", with: 'Washington, D.C., formally
    the District of Columbia and commonly referred to as "Washington",
    "the District", or simply "D.C.", is the capital of the United States.
    The signing of the Residence Act on July 16, 1790, approved the creation
    of a capital district located along the Potomac River on the countrys
    East Coast.')
    click_button "Create new post"
    assert page.has_content? "You entered wrong data"

  end

  def test_enter_wrong_body_and_see_error_message

    fill_in("title_field", with: "awsasdasdasd")
    fill_in("body_field", with: "Washington, D.C")
    click_button "Create new post"
    assert page.has_content? "You entered wrong data"

  end




end
