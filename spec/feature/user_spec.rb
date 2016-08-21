require 'rails_helper'
require 'pry'

feature 'User create ' do
  before :each do
    @user = create(:user)
  end

  scenario 'with valid name' do
    
    visit "/users/new"
    fill_in 'user_name', with: "test"
    fill_in 'user_email', with: "test@gmail.com"
    click_button 'Create User'
    expect(page).to have_content('User was successfully created')
  end

  scenario 'with blank name' do   
    visit new_user_path
    fill_in 'user_name', with: ''
    fill_in 'user_email', with: "test@gmail.com"
    click_button 'Create User'
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'with blank email' do   
    visit new_user_path
    fill_in 'user_name', with: 'test'
    fill_in 'user_email', with: ''
    click_button 'Create User'
    expect(page).to have_content("Email is invalid")
  end

  scenario 'with invalid email' do   
    visit new_user_path
    fill_in 'user_name', with: 'test'
    fill_in 'user_email', with: 'test'
    click_button 'Create User'
    expect(page).to have_content("Email is invalid")
  end

end