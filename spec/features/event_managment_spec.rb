require 'spec_helper'

describe "Event Test" do

  specify 'I can add event' do

    visit new_event_path
    fill_in 'Title', with: 'Event 1'
    fill_in 'Details', with: 'some details'
    fill_in 'Date', with: '23-07-2012'
    select '16'
    select '20'
    fill_in 'Duration', with: '60'

    click_button 'Create'
    page.should have_content 'Event was successfully created.'
     # expect(page).to have_content 'Event was successfully created.'
  end

  end