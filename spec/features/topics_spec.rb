require 'spec_helper'
include UserHelper

feature 'Topics index page' do

  let!(:topic) { FactoryGirl.create(:topic) }

  context "after signing in, user can" do
    scenario "see a topic workspace" do
      sign_in
      expect(page).to have_content("Ruby")
    end

    xscenario "click on a topic to inspect its snippets" do
      click_on("Ruby")
      expect(current_path).to eq topics_id_path
    end
  end

end