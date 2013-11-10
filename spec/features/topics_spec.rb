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

    xscenario "click on a topic to inspect its snippets" do
      click_on("Ruby")
      expect(current_path).to eq topics_id_path
    end
  end

end

feature 'User creates a topic' do

  let!(:topic) { FactoryGirl.create(:topic) }

  before(:each) do
    sign_in
  end

  context "with valid params" do
    scenario "is successful" do
      fill_in 'topic_name', with: "Node.js"
      click_on 'Create Topic'
      expect(page).to have_content("Node.js")
    end
  end

  context "with invalid params" do
    scenario "with no name" do
      click_on 'Create Topic'
      expect(page).to have_content("Name can't be blank")
    end

    scenario "with repeated name" do
      fill_in 'topic_name', with: 'Ruby'
      click_on 'Create Topic'
      expect(page).to have_content("Name has already been taken")
    end
  end

end