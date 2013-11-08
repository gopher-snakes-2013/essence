require 'spec_helper'

feature 'Guest can sign up' do
  scenario 'A guest should be redirected to sign in path when visiting the root path' do
    visit root_path
    expect(current_path).to eq sign_in_path
  end

  scenario 'A guest should be able to visit a sign up form from the home page' do
    visit root_path
    click_on 'Sign up'
    expect(current_path).to eq sign_up_path
  end


end