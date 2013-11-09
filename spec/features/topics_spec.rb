require 'spec_helper'
include UserHelper

feature 'Topics index page', js: true do

  before(:all) do
    sign_in
  end

  context "after signing in, user can" do
    xscenario "see a topic workspace" do
      expect(page).to have_content("Ruby")
    end

    xscenario "click on a topic to inspect its snippets" do
      click_on("Ruby")
      expect(current_path).to eq topics_id_path
    end
  end

end