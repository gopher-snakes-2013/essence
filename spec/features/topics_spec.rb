require 'spec_helper'
include UserHelper

feature 'Topics index page' do

  let!(:topic) { FactoryGirl.create(:topic) }

  context "after signing in, user can" do

    before(:each) do
      sign_in
    end

    scenario "see a topic workspace" do
      expect(page).to have_content("Ruby")
    end

    scenario "create a new topic" do
      fill_in 'topic_name', with: "Node.js"
      click_on 'Create Topic'
      expect(page).to have_content("Node.js")
    end

    xscenario "click on a topic to inspect its snippets" do
      click_on("Ruby")
      expect(current_path).to eq topics_id_path
    end
  end

end