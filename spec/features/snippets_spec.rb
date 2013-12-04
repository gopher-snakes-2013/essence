require 'spec_helper'
include UserHelper

feature 'Snippets', js:true do

  let!(:user) { FactoryGirl.create(:user_with_topics_with_snippets) }

  before(:each) do
    sign_in_as(user)
  end

  context "User deletes a snippet on topic#show page" do
    scenario 'When a user deletes a snippet, there should be no more snippet', js: true do
      click_on(user.topics.first.name)
      first_snippet = user.topics.first.snippets.first.content
      page.should have_content(first_snippet)
      find('.delete-button').click
      page.should_not have_content(first_snippet)
    end
  end

  context "User deletes an unaffiliated snippet on topic#index page" do
    scenario 'snippet should be removed from the page', js: true do
      first_snippet = user.snippets.first.content
      find('.topic-list .delete-button').click # Deletes topic so it leaves an unaffiliated snippet
      page.driver.browser.switch_to.alert.accept
      find('.unaffiliated .delete-button').click # Deletes the unaffiliated snippet
      page.should_not have_content(first_snippet)
    end
  end
end