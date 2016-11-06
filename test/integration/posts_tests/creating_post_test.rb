require 'test_helper'
class CreatingPostTest < ActiveSupport::TestCase

  def setup
    signin(FactoryGirl.create(:user))
    visit "/posts/new"
  end

  def test_is_there_create_button
    assert page.has_button? "Create post"
  end

  #def test_click_button_and_see_error_message
    #click_button "Create post"
    #assert page.has_selector? 'error_explanation'
  #end

  def test_enter_true_data_and_see_created_post

    fill_in 'title-field', with: 'Washington, D.C.'
    fill_in 'body-field', with: 'Washington, D.C., formally the District of
  Columbia and commonly referred to as "Washington", "the District", or
   simply "D.C.", is the capital of the United States. The signing of the
   Residence Act on July 16, 1790, approved the creation of a capital
   district located along the Potomac River on the countrys East Coast.'

    click_button "Create post"
    assert !(page.has_selector? 'error_explanation'), "Created true post with error"

    assert page.has_selector?('.post-body'), "Created post without body"
    assert page.has_selector?('.post-title'), "Created post without title"

  end

  def test_adding_image
    @post = FactoryGirl.create(:user, :with_post)
    visit "/posts/1"
    assert page.has_selector?('.post-image'), "Created post without image"
  end

end
