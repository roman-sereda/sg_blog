require 'test_helper'

class DeletePostTest < ActiveSupport::TestCase
  def setup
    signin(FactoryGirl.create(:user, :with_post))
  end

  def test_delete_post
    visit "/posts/1"
    click_button("Delete post")
    assert !(page.has_selector? ".post-title")
  end
end
