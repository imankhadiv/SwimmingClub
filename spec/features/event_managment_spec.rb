# require 'spec_helper'
#
# describe 'Add/Delete/Edit Events' do
#    let!(:event) { FactoryGirl.create(:event) }
#
#
#   specify 'I can create an event' do
#
#     visit new_event_path
#     fill_in 'Title', with: 'Event 1'
#     fill_in 'Details', with: 'some details'
#     fill_in 'Date', with: '23-07-2016'
#     fill_in 'Duration', with: '30'
#
#     click_button 'Submit'
#     expect(page).to have_content 'Event was successfully created.'
#
#   end
#
#   specify 'I can not add an event without filling in a title' do
#
#     visit new_event_path
#     # fill_in 'Title', with: 'Event 1'
#     fill_in 'Details', with: 'some details'
#     fill_in 'Date', with: '23-07-2012'
#     select '16'
#     select '20'
#     fill_in 'Duration', with: '60'
#
#     click_button 'Submit'
#     expect(page).to have_content "can't be blank"
#   end
#
#   specify 'I can add an event without filling in details' do
#
#     visit new_event_path
#     fill_in 'Title', with: 'Event 1'
#     fill_in 'Date', with: '23-07-2012'
#     select '16'
#     select '20'
#     fill_in 'Duration', with: '60'
#
#     click_button 'Submit'
#     expect(page).to have_content "can't be blank"
#
#   end
#
#   specify 'I can add an event without filling in a date' do
#
#     visit new_event_path
#      fill_in 'Title', with: 'Event 1'
#      fill_in 'Details', with: 'some details'
#      fill_in 'Duration', with: '60'
#
#      click_button 'Submit'
#      expect(page).to have_content "can't be blank"
#   end
#
#   specify 'I can not add an event without filling in duration' do
#
#     visit new_event_path
#      fill_in 'Title', with: 'Event 1'
#      fill_in 'Details', with: 'some details'
#      fill_in 'Date', with: '23-07-2012'
#
#     click_button 'Submit'
#     expect(page).to have_content "can't be blank"
#
#   end
#
#   specify 'I can not add an event in the past' do
#
#     visit new_event_path
#     fill_in 'Title', with: 'Event 1'
#     fill_in 'Details', with: 'some details'
#     fill_in 'Date', with: '23-07-2010'
#
#     click_button 'Submit'
#     expect(page).to have_content "can't be in the past"
#
#
#   end
#
#   specify 'I can not add an event with duration less than zero' do
#
#     visit new_event_path
#     fill_in 'Title', with: 'Event 1'
#     fill_in 'Details', with: 'some details'
#     fill_in 'Date', with: '23-07-2012'
#     fill_in 'Duration', with: '-3'
#
#     click_button 'Submit'
#     expect(page).to have_content 'must be greater than 0'
#
#   end
#
#    specify 'I can edit an event' do
#
#      visit events_path
#
#      click_link 'Edit'
#
#      expect(page).to have_content 'Editing Event'
#
#      fill_in 'Title', with: 'Event 1'
#      fill_in 'Details', with: 'some details'
#      fill_in 'Date', with: '23-07-2016'
#      fill_in 'Duration', with: '30'
#
#       click_button 'Submit'
#       expect(page).to have_content 'Event was successfully updated.'
#
#    end
#
#    specify 'Given an event exists I can delete it' do
#      visit events_path
#
#      expect(page).to have_content event.title
#
#      click_link 'Destroy'
#
#       page.should have_content 'Event was successfully destroyed.'
#    end
#
#
#
#
# end