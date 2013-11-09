require 'spec_helper'
include UserHelper

feature 'Topics index page', js: true do

  before(:all) do
    sign_in
  end

  context "after signing in, user can" do
    xscenario "see a topic workspace" do
      expect(page).to have_content("Ruby")
    end

    xscenario "click on a topic to inspect its snippets" do
      click_on("Ruby")
      expect(current_path).to eq topics_id_path
    end
  end

end



  # before(:each) do
  #   visit root_path
  #   john = User.new
  #   john.email = 'john.doe@mail.com'
  #   john.password = 'abc123'
  #   john.save

  #   fill_in 'email', with: 'john.doe@mail.com'
  #   fill_in 'password', with: 'abc123'
  #   click_on 'Sign in'
  # end

  # scenario 'After signing in, a user can view a list of their topics' do
  #   expect(page).to have_content("ruby")
  #   expect(page).to have_content("ajax")
  #   expect(page).to have_content("javascript")
  # end