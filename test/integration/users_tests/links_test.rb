require 'test_helper'

class LinksTest < ActiveSupport::TestCase

  def setup
    @user = FactoryGirl.create(:user, :with_post)
    signin(@user)
    "/"
  end

  def test_see_if_there_is_a_link_to_user_in_post_and_visit
    assert page.has_content?"#{@user.name}"
  end

end
