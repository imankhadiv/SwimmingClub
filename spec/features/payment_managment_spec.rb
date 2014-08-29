require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe 'Accessing Payment page' do

  before(:each) do
    role1 = Role.create(name: 'Welfare Officer')
    role2 = Role.create(name: 'Coach')
    user = FactoryGirl.create(:user)
    user.roles << role1
    user.roles << role2
    user.approved = true
    login_as(user, :scope => :user)

  end

  # describe 'GET /payments' do

    specify 'User need to login to access to the payment page' do
      logout(:user)
      visit payments_path
      # save_and_open_page
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end


    specify 'Welfare officers and Coaches can not access the payment page' do
      visit payments_path
      expect(page).to have_content 'You are not authorized to access this page.'

    # page.should have_content 'Paid'
    # page.should have_content 'Unpaid'
      end

  end

  describe 'Committee member can create view/create/edit/delete a payment' do

    before(:each) do
      roles = FactoryGirl.create(:role);
      role = Role.create(name: 'Committee')
      user = FactoryGirl.create(:user)
      user.roles << role
      @swimmer = FactoryGirl.create(:swimmer)
      @swimmer.user = user
      user.approved = true
      login_as(user, :scope => :user)

    end

    specify 'As a committee member I can view a list of payments' do

        visit payments_path
        expect(page).to have_content 'Paid'
        expect(page).to have_content 'Unpaid'


        end
    specify 'As a committee member I can create a payment' do

        visit payments_path
        click_link 'Add New Payment'

        expect(page).to have_content 'New Payment Schedule'

        fill_in 'Details', with: 'some details'
        fill_in 'Amount', with: 10
        fill_in 'Due date', with: '23-07-2015'

        # save_and_open_page
        click_button 'submit'

        expect(page).to have_content 'Payment was successfully created.'

    end
    specify 'As a committee member I can not create a payment in the past' do

        visit payments_path
        click_link 'Add New Payment'

        expect(page).to have_content 'New Payment Schedule'

        fill_in 'Details', with: 'some details'
        fill_in 'Amount', with: 10
        fill_in 'Due date', with: '23-07-2010'

        # save_and_open_page
        click_button 'submit'

        expect(page).to have_content "can't be in the past"

    end

    specify 'As a committee member I can not create a payment with blank fields' do

      visit new_payment_path

      click_button 'submit'

      expect(page).to have_content "can't be blank"

    end
    let(:payment) {FactoryGirl.create(:payment)}

    specify 'As a committee member I can edit a payment' do
      pending
      payment = FactoryGirl.create(:payment)

      payment.swimmer = @swimmer
      visit edit_payment_path(payment.id)
      expect(page).to have_content 'Editing'

    end


  end


