require 'spec_helper'

feature 'Guest can sign up', js: true do
  before(:each) do
    visit root_path
  end

  scenario 'A guest should be redirected to sign in path when visiting the root path', js: true do
    expect(current_path).to eq sign_in_path
  end

  scenario 'A guest should be able to visit a sign up form from the home page', js: true do
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

  scenario 'A user can sign in', js: true do
    john = User.new
    john.email = 'john.doe@mail.com'
    john.password = 'abc123'
    john.save
    fill_in 'email', with: 'john.doe@mail.com'
    fill_in 'password', with: 'abc123'
    click_on 'Sign in'
    expect(current_path).to eq root_path
  end

  scenario 'A user can log out', js: true do
    john = User.new
    john.email = 'john.doe@mail.com'
    john.password = 'abc123'
    john.save
    fill_in 'email', with: 'john.doe@mail.com'
    fill_in 'password', with: 'abc123'
    click_on 'Sign in'
    click_on 'Sign out'
    expect(current_path).to eq sign_in_path
  end

  scenario 'A user can click the logo to reach return to the home page' do
    click_on 'Forgot password?'
    click_on 'Essence'
    expect(current_path).to eq sign_in_path
  end
end