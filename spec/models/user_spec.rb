  require 'spec_helper'

  class UserTest < ActiveSupport::TestCase

    describe User do
      let!(:role) {FactoryGirl.create(:role)}
      let!(:user) { FactoryGirl.create(:user) }

      it 'has a valid factory' do
        expect(user).to be_valid
      end
    #
      it 'does not allow duplicate email address' do

        expect(FactoryGirl.build(:user)).not_to be_valid

      end
    #
      it 'is invalid without an email' do
        user.email = nil
        expect(user).not_to be_valid

      end
    #
      it 'is invalid without a first name' do
        user.email = 'sample@yo.com'
         user.first_name = nil
        expect(user).not_to be_valid

      end

      it 'is invalid without a last name' do
        user.first_name = 'user1'
        user.last_name = nil
        # user.should_not be_valid
        expect(user).not_to be_valid

      end

      it 'is invalid without a last name' do
        user.first_name = 'user1'
        user.last_name = nil
        expect(user).not_to be_valid

      end

      it 'returns a full name of the user' do
         user_full_name = user.combined_name
         expect(user_full_name).to eq 'First_name Last_name'
      end

      it 'returns true if a user has a given role' do
        expect(user.check_roles ['Welfare Officer']) === true
        end

      it 'returns false if a user does not have a given role' do
        expect(user.check_roles ['Swimmer']) === true
      end

      it 'capitalize name when a user sign up' do
        user.first_name = 'myfirstname'
        user.last_name = 'mylastname'
        user.save
        expect(user.first_name).to eq 'Myfirstname'
        expect(user.last_name).to eq 'Mylastname'
      end

    it 'returns roles' do

      expect(user.get_roles).to eq ['Welfare Officer']

    end

    it 'check if the user have any roles' do

      user.roles = []
      expect(user.check_roles ['Welfare Officer']).to eq false

    end

    it 'assigns roles to user' do

      user.roles = []
      user.assign_roles_to_user

      expect(user.get_roles).to eq ['Welfare Officer']

    end


    end



  end
