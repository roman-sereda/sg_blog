require 'test_helper'

class PaginationTest < ActiveSupport::TestCase
  def setup
    signin(FactoryGirl.create(:user, :with_posts))
    visit "/"
  end

  def test_visit_users_index_page_and_see_15_from_30_users
    create_30_users
    assert_equal 15, page.all(".user-list").count
  end

  def test_visit_second_users_index_page_and_see_last_15_users
    create_30_users
    visit "/users?page=2"
    assert_equal 15, page.all(".user-list").count
  end

  def test_visit_posts_index_page_and_see_12_from_24_posts
    create_30_posts
    assert_equal 12, page.all(".post-full").count
  end

  def test_visit_second_users_index_page_and_see_last_15_posts
    create_30_posts
    visit "/?page=2"
    assert_equal 12, page.all(".post-full").count
  end


  def create_30_users
    FactoryGirl.create_list(:user, 30)
    visit "/users"
  end

  def create_30_posts
    FactoryGirl.create(:user, :with_many_posts)
    visit "/posts"
  end
end
