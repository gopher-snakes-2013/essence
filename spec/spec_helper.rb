ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'clearance/testing'
require 'factory_girl_rails'
require 'faker'
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
  def create_user_and_sign_in
    user = FactoryGirl.create(:user)
    visit root_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign in'
  end

  def sign_in_as(user)
    visit root_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign in'
  end
end

module SourceHelper
  def create_sample_source
    sample_pdf = User.last.sources.new
    sample_pdf.url = "https://www.irs.gov/pub/irs-pdf/f990ez.pdf"
    sample_pdf.title = "Sample"
    sample_pdf.save
  end
end