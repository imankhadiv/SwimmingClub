require 'spec_helper'


describe 'Signing up and signing in' do
  # before(:each) do
  #   role = FactoryGirl.create(:role2)
  #   # user = FactoryGirl.create(:user)
  #
  # end
  # let!(:role2) {FactoryGirl.create(:role2)}
  # role = FactoryGirl.create(:role2)
  # FactoryGirl.create(:role, :name => 'Welfare Officer')
  #
  let!(:role) {FactoryGirl.create(:role)}
  let!(:user) { FactoryGirl.create(:user) }
#
#
#
#
  specify 'As a welfare officer I can sign up' do
      visit new_user_registration_path
      fill_in 'Email', with: 'user1@yahoo.com'
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      fill_in 'First name', with: user.first_name
      fill_in 'Last name', with: user.last_name
      select 'Welfare Officer'
      # fill_in '#captcha'

      click_button 'Sign Up'
      expect(page).to have_content 'Sign up successful'
      expect(page).to  have_content 'Your Sign up was successful but approval is required from an administrator. When you are approved, you will be able to sign in. Thank you!'
#
    end
    specify 'As a swimmer I can sign up' do
      role = Role.create(name: 'Swimmer')
      visit new_user_registration_path
      fill_in 'Email', with: 'swimmer@yahoo.com'
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      fill_in 'First name', with: user.first_name
      fill_in 'Last name', with: user.last_name
      select 'Swimmer'

      click_button 'Sign Up'
      expect(page).to have_content 'Please Complete Your Registration'

      fill_in 'ASA Number', with: 12345
      fill_in 'ASA Category', with: 'Cat3'
      select 'A-Squad'
      select 'White'
      fill_in 'Date of birth', with: '23-07-2012'
      choose 'Male'
      choose 'Yes'

      fill_in 'Line 1', with: 'Solly Street'
      fill_in 'City', with: 'Sheffield'
      fill_in 'Postcode', with: 'SA32D'
      fill_in 'Telephone', with: '01234567899'
      fill_in 'Emergency Contact', with: '01234567899'

      fill_in 'Medical history', with:'history'
      fill_in 'Medication', with: 'medication'
      fill_in 'Allergies', with: 'allergies'
      select 'Hearing'
      fill_in 'Doctor', with: 'my doctor'

      fill_in 'Line 1', with: 'Solly Street'
      fill_in 'City', with: 'Sheffield'
      fill_in 'Postcode', with: 'SA32D'
      fill_in 'Telephone', with: '01234567899'
      fill_in 'Emergency Contact', with: '01234567899'

      click_button 'Submit'

      expect(page).to have_content 'Sign up successful'
      expect(page).to  have_content 'Your Sign up was successful but approval is required from an administrator. When you are approved, you will be able to sign in. Thank you!'

    end


  #
  specify 'As a coach I can sign up' do

    role = Role.create(name: 'Coach')

    visit new_user_registration_path
    fill_in 'Email', with: 'coach@yahoo.com'
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    select 'Coach'

    click_button 'Sign Up'
    expect(page).to  have_content 'Your Sign up was successful but approval is required from an administrator. When you are approved, you will be able to sign in. Thank you!'

  end

  specify 'As a parent I can sign up' do

      role = Role.create(name: 'Parent')

      visit new_user_registration_path
      fill_in 'Email', with: 'parent1@yahoo.com'
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      fill_in 'First name', with: user.first_name
      fill_in 'Last name', with: user.last_name
      select 'Parent'

      click_button 'Sign Up'
      expect(page).to have_content 'Please Complete Your Registration'


  end

  specify 'As a parent I can add my child' do

    role = Role.create(name: 'Parent')
    # user = FactoryGirl.create(:user)

  end


#       select 'Parent'
#       ignore '#captcha'
#
#       # expect(page).to have_content 'Please Complete Your Registration'
#
#       select 'Father'
#       fill_in 'Line 1', with: 'Solly Street'
#       fill_in 'City', with: 'Sheffield'
#       fill_in 'Postcode', with: 'SA32D'
#       fill_in 'Telephone', with: '01234567899'
#       fill_in 'Emergency Contact', with: '01234567899'
#
#         find(:xpath, "//input[@id='email']").set user.email
#         find(:xpath, "//input[@id='password']").set user.password
#
#         click_button 'Add'
# #
#         expect(page).to have_content "#{user.combined_name}"
#
#        click_button 'Sing up'
#        save_and_open_page

#
    specify 'Do not allow user to sign up without filling all the fields' do
      visit new_user_registration_path
      fill_in 'Email', with: 'testuser@yahoo.com'
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password

      click_button 'Sign Up'
       expect(page).not_to have_content 'Sign up successful'
    end


end
