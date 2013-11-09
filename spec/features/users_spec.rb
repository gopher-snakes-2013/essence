require 'spec_helper'

feature 'Guest can sign up' do
  before(:each) do
    visit root_path
  end

  scenario 'A guest should be redirected to sign in path when visiting the root path' do
    expect(current_path).to eq sign_in_path
  end

  scenario 'A guest should be able to visit a sign up form from the home page' do
    click_on 'Sign up'
    expect(current_path).to eq sign_up_path
  end


  scenario 'A user can sign up', js: true do
    click_on 'Sign up'
    fill_in 'email', with: 'john.doe@mail.com'
    fill_in 'password', with: 'abc123'
    click_on 'Sign up'
    expect(current_path).to eq root_path
  end

  scenario 'A user can sign in' do
    User.create(email: 'john.doe@mail.com', password: 'abc123')
    fill_in 'email', with: 'john.doe@mail.com'
    fill_in 'password', with: 'abc123'
    click_on 'Sign in'
    expect(current_path).to eq root_path
  end

  scenario 'A user can log out' do
    User.create(email: 'john.doe@mail.com', password: 'abc123')
    fill_in 'email', with: 'john.doe@mail.com'
    fill_in 'password', with: 'abc123'
    click_on 'Sign in'
    click_on 'Sign out'
    expect(current_path).to eq sign_in_path
  end


end