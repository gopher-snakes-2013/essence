require 'spec_helper'
include UserHelper

feature 'Snippets' do

  let!(:user) { FactoryGirl.create(:user_with_topics_with_snippets) }

  before(:each) do
    sign_in_as(user)
    click_on(user.topics.first.name)
  end

  context "User deletes a snippet" do

    scenario 'When a user deletes a snippet, there should be no more snippet', js: true do
      first_snippet = user.topics.first.snippets.first.content
      page.should have_content(first_snippet)
      click_on 'Delete'
      page.should_not have_content(first_snippet)
    end

  end
end