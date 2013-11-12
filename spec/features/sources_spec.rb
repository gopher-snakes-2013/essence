require 'spec_helper'
include UserHelper

feature 'sources library' do
  before(:each) do
    create_user_and_sign_in
  end

  context 'with successfully logged in user' do
    it 'should display a link to see the list of sources', js: true do
      page.should have_link("Library", href: sources_path)
    end

    it "shows a link to a source", js: true do
      click_on('Library')
      page.should have_link("test doc", href: "/sources/1")
    end

    # this test is checking for a html rendered pdf, we have it hardcoded right now, **** change it later *****
    it "can click on a source to view it", js: true do
      click_on('Library')
      click_on('test doc')
      expect(current_path).to eq('/sources/1')
    end
  end
end