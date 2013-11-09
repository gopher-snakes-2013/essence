require 'spec_helper'
include UserHelper

feature 'sources library' do

  context 'with successfully logged in user' do
    it 'should display a link to see the list of sources', js: true do
      create_user_and_sign_in
      page.should have_link("library", href: sources_path)

    end
  end
end