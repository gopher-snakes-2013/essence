require 'spec_helper'
include UserHelper
include SourceHelper

feature 'Sources library:' do
  before(:each) do
    create_user_and_sign_in
    create_sample_source
    click_on('Library')
  end

  context 'a logged in user clicks on library and' do

    it "sees a link to a source", js: true do
      page.should have_link("Sample", href: "/sources/1")
    end

    # this test is checking for a html rendered pdf, we have it hardcoded right now, **** change it later *****
    it "can click on a source to view it", js: true do
      click_on('Sample')
      expect(current_path).to eq('/sources/1')
    end
  end
end