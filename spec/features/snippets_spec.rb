require 'spec_helper'
include UserHelper

feature 'Snippets' do

  let!(:user) { FactoryGirl.create(:user_with_topics_with_snippets) }

  before(:each) do
    sign_in_as(user)
  end

  context "User deletes a snippet on topic#show page" do
    scenario 'When a user deletes a snippet, there should be no more snippet', js: true do
      click_on(user.topics.first.name)
      first_snippet = user.topics.first.snippets.first.content
      page.should have_content(first_snippet)
      click_on 'Delete'
      page.should_not have_content(first_snippet)
    end
  end

  context "User deletes an unaffiliated snippet on topic#index page" do
    scenario 'snippet should be removed from the page', js: true do
      first_snippet = user.topics.first.snippets.first.content
      click_on("Delete")
      # then that topic's snippet will be on the page
      click_on("Delete")
      page.should_not have_content(first_snippet)
    end
  end
end