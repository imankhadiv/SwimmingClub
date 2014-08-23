require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'Calendar tests' do

    before(:each) do
      role = Role.create name: 'Administrator'
      user = FactoryGirl.create(:user)
      user.approved = true
      user.roles << role
      login_as(user, :scope => :user)
    end


    let!(:event) { FactoryGirl.create(:event) }

    specify 'Given an event exists I can view it in calendar' do
        visit calendar_index_path

        expect(page).to have_link event.title
        click_link 'Event1'
        page.should have_content event.title
    end


      specify 'Adding new event in the calendar' do

        visit calendar_index_path

        page.should have_content 'Calendar'
        click_link 'Add New Event'
        page.should have_content 'New Event'

      end





end
