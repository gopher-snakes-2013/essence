require 'spec_helper'
include UserHelper
include SourceHelper

feature 'Sources library:' do
  before do
    create_user_and_sign_in
    create_sample_source
  end

  context 'a logged in user clicks on library and' do
    # this test is checking for a html rendered pdf, we have it hardcoded right now, **** change it later *****
    it "can click on a source to view it", js: true do
      click_on('Library')
      click_on('Sample')
      expect(current_path).to eq('/sources/1')
    end
  end
end