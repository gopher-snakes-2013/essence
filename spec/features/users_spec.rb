require 'spec_helper'
include UserHelper

feature 'Guest signing up', js: true do
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
    user = FactoryGirl.build(:user)

    click_on 'Sign up'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign up'
    expect(current_path).to eq root_path
  end

end

feature 'User signing in' do

  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit root_path
  end

  scenario 'with valid params', js: true do
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign in'
    expect(current_path).to eq root_path
  end

  scenario 'with invalid params', js: true do
    fill_in 'email', with: 'john'
    fill_in 'password', with: user.password
    click_on 'Sign in'
    expect(current_path).to eq sign_in_path
  end

end

feature "User signing out" do

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'A user can log out', js: true do
    sign_in_as(user)
    click_on 'Sign Out'
    expect(current_path).to eq sign_in_path
  end

  scenario 'A user can click the logo to reach return to the home page' do
    visit root_path
    click_on 'Forgot password?'
    click_on 'Essence'
    expect(current_path).to eq sign_in_path
  end

end