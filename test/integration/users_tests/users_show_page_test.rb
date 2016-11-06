require 'test_helper'

class UsersShowPageTest < ActiveSupport::TestCase

  def setup
    @user = FactoryGirl.create(:user)
    signin(@user)
    "/users/1"
  end

  def test_see_map_on_users_page_with_default_coor
    assert page.has_selector?("#map"), "no map in profile"

    assert_equal @user.latitude, 0, "latitude is not default"
    assert_equal @user.longitude, 0, "longitude is not default"
  end

  def test_see_users_posts
    @us = FactoryGirl.create(:user, :with_posts)
    visit "/users/#{@us.id}"
    assert_equal 5, page.all(".title").count
  end

end
