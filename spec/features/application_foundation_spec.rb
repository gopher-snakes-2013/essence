require 'spec_helper'

feature "Application load" do
  scenario "Guest can view the foundation page" do
    visit root_path
    expect(page).to have_content("Essence")
  end
end