require 'spec_helper'
describe 'Signing up and signing in' do
  specify 'As an administrator I can sign up' do
    visit new_address_path
    fill_in "Email", with: "testuser@sheffield.ac.uk"
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    fill_in "Firstname", with: user.firstname
    fill_in "Lastname", with: user.lastname
    fill_in "Course", with: user.course
    fill_in "Ucard", with: user.ucard
    select 'Level1'

    click_button "Sign Up"
    page.should have_content "Sign up successful"
    page.should have_content "Your Sign up was successful but approval is required from an administrator. When you are approved, you will be able to sign in. Thank you!"

  end
  end