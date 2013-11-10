require 'spec_helper'
include UserHelper

feature 'Topics index page' do

  let!(:topic) { FactoryGirl.create(:topic) }

  context "after signing in, user can" do

    before(:each) do
      sign_in
    end

    xscenario "see a default topic" do
      expect(page).to have_content("Unassigned")
    end

    scenario "click on a topic to inspect its snippets" do
      click_on(topic.name)
      expect(current_path).to eq topic_path(topic)
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
      fill_in 'topic_name', with: topic.name
      click_on 'Create Topic'
      expect(page).to have_content("Name has already been taken")
    end
  end
end

feature 'User clicks on a topic' do
  let!(:snippet) { FactoryGirl.create(:snippet) }
  let!(:topic) { snippet.topic }

  before(:each) do
    sign_in
  end

  scenario 'and sees a list of associated snippets' do
    click_on topic.name
    expect(page).to have_content(topic.snippets.first.content)
  end

end

feature 'User deletes a topic' do

  let!(:topic) { FactoryGirl.create(:topic) }

  before(:each) do
    sign_in
  end

  scenario "can click on a button to delete a topic" do
    click_on "Delete"
    expect(page).to_not have_content(topic.name)
  end

end