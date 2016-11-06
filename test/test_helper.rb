ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require 'database_cleaner'

class ActiveSupport::TestCase

  include FactoryGirl::Syntax::Methods
  include Capybara::DSL

  DatabaseCleaner.strategy = :truncation

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

end

def signin(user)
 visit "/sessions/new"
 fill_in "email-field",    with: user.email.upcase
 fill_in "password-field", with: user.password
 click_button "Sign in"
end
