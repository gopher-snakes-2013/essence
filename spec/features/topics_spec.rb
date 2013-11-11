require 'spec_helper'
include UserHelper

feature 'Topics index page' do

  let(:user) { FactoryGirl.build(:user) }
  let!(:topic) { FactoryGirl.create(:topic) }

  context "after signing in, user can" do

    before(:each) do
      sign_in_as(user)
    end

    xscenario "see a default topic" do
      expect(page).to have_content("Unassigned")
    end

    scenario "click on a topic to inspect its snippets" do
      click_on(topic.name)
      expect(current_path).to eq topic_path(topic)
    end

    scenario "see their username" do
      expect(page).to have_content(user.email)
    end
  end

end

feature 'User creates a topic' do

  let(:user) { FactoryGirl.build(:user_with_topic) }
  let!(:topic) { FactoryGirl.create(:topic) }

  before(:each) do
    sign_in_as(user)
  end

  scenario "can click on the plus icon to view new topic form", js: true do
    click_on("Add new")
    expect(page).to have_content("Name")
  end

  context "with valid params", js: true do
    scenario "is successful" do
      click_on("Add new")
      fill_in 'topic_name', with: "Node.js"
      click_on 'Create Topic'
      expect(page).to have_content("Node.js")
    end
  end

  context "with invalid params", js: true do
    scenario "with no name" do
      click_on("Add new")
      click_on 'Create Topic'
      expect(page).to have_content("Name can't be blank")
    end

    scenario "with repeated name" do
      click_on("Add new")
      fill_in 'topic_name', with: topic.name
      click_on 'Create Topic'
      expect(page).to have_content("Name has already been taken")
    end
  end
end

feature 'User clicks on a topic' do
  let(:user) { FactoryGirl.build(:user) }
  let!(:topic) { FactoryGirl.create(:topic_with_snippets) }

  before(:each) do
    sign_in_as(user)
  end

  scenario 'and sees a list of associated snippets', js: true do
    click_on topic.name
    expect(page).to have_content(topic.snippets.first.content)
    expect(page).to have_content(topic.snippets.last.content)
  end

end

feature 'User deletes a topic' do

  let(:user) { FactoryGirl.build(:user) }
  let!(:topic) { FactoryGirl.create(:topic) }

  before(:each) do
    sign_in_as(user)
  end

  scenario "can click on a button to delete a topic" do
    click_on "Delete"
    expect(page).to_not have_content(topic.name)
  end

end