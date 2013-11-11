require 'spec_helper'
include UserHelper

feature 'Snippets' do

  let!(:user) { FactoryGirl.create(:user_with_topics_with_snippets) }

  scenario 'User can see a delete button for a snippet', js: true do
    sign_in_as(user)
    click_on(user.topics.first.name)
    page.has_selector?(:link_or_button, "Delete")
  end
