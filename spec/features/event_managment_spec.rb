require 'spec_helper'

describe 'Add/Delete/Edit Events' do
   let!(:event) { FactoryGirl.create(:event) }

   before(:each) do
     roles = FactoryGirl.create(:role);
     role = Role.create(name: 'Committee')
     user = FactoryGirl.create(:user)
     user.roles << role
     user.approved = true
     login_as(user, :scope => :user)

   end


  specify 'I can create an event in the future' do

    visit new_event_path
    fill_in 'Title', with: 'Event 1'
    fill_in 'Details', with: 'some details'
    fill_in 'Date', with: '23-07-2016'


    click_button 'Submit'
    expect(page).to have_content 'Event was successfully created.'

  end

  specify 'I can not create an event in the past' do

    visit new_event_path
    fill_in 'Title', with: 'Event 1'
    fill_in 'Details', with: 'some details'
    fill_in 'Date', with: '23-07-2010'
    # select 'Start', with: '12:00'
    # fill_in 'Finish', with:  '13:00'

    click_button 'Submit'
    expect(page).to have_content "can't be in the past"

  end

  specify 'I can not add an event without filling in a title' do

    visit new_event_path
    fill_in 'Details', with: 'some details'
    fill_in 'Date', with: '23-07-2012'
    select '16'
    select '20'

    click_button 'Submit'
    expect(page).to have_content "can't be blank"
  end

  specify 'I can add an event without filling in details' do

    visit new_event_path
    fill_in 'Title', with: 'Event 1'
    fill_in 'Date', with: '23-07-2018'
    select '16'
    select '20'

    click_button 'Submit'
    expect(page).to have_content "can't be blank"

  end

  specify 'I can add an event without filling in a date' do

    visit new_event_path
     fill_in 'Title', with: 'Event 1'
     fill_in 'Details', with: 'some details'
    select '16'
    select '20'

     click_button 'Submit'
     expect(page).to have_content "can't be blank"
  end



   specify 'I can edit an event' do

     visit edit_event_path(event)
     expect(page).to have_content 'Editing Event'

     fill_in 'Title', with: 'Event 1'
     fill_in 'Details', with: 'some details'
     fill_in 'Date', with: '23-07-2016'

      click_button 'Submit'
      expect(page).to have_content 'Event was successfully updated.'

   end

   specify 'Given an event exists I can delete it' do
     visit event_path(event)

     expect(page).to have_content event.title

     click_link 'Delete'

      page.should have_content 'Event was successfully destroyed.'
   end


end

describe 'Accessing to the event page' do

  let!(:event) { FactoryGirl.create(:event) }
  let!(:role) {FactoryGirl.create(:role)}
  let!(:user) {FactoryGirl.create(:user)}

  before(:each) do

    login_as(user, :scope => :user)

  end

  specify 'as a Welfare Officer I can not create an event' do

    visit new_event_path

    expect(page).to have_content 'You are not authorized to access this page.'

  end






end