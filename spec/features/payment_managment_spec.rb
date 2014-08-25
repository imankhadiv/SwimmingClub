require 'spec_helper'


describe 'Payments  Test' do
  before(:each) do
    role = FactoryGirl.create(:role)
    user = FactoryGirl.create(:user)
    user.roles << role
    login_as(user, :scope => :user)
    # login_as(user)

  end

  describe 'View list of available FOH' do

    specify 'As a committee member I can view the payments history' do

      visit payments_path
      #
      # page.should have_content 'Paid'
      # page.should have_content 'Unpaid'

    end
  end

  end