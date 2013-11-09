ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'clearance/testing'
require 'factory_girl_rails'
require 'shoulda-matchers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  config.include Capybara::DSL

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_base_class_for_anonymous_controllers = false
  config.use_transactional_fixtures = false
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

#HELPER METHODS
module UserHelper

  def sign_up
    click_on 'Sign up'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test123'
    click_on 'Sign up'
  end

  def sign_in
    user = FactoryGirl.build(:user)

    visit root_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign in'
  end

end