  # require 'spec_helper'
  #
  # class UserTest < ActiveSupport::TestCase
  #   # test "the truth" do
  #   #   assert true
  #   # end
  #   describe User do
  #     let!(:user) { FactoryGirl.create(:user) }
  #     # let!(:user2) {FactoryGirl.create(:user2)}
  #
  #
  #     it 'has a valid factory' do
  #       expect(user).to be_valid
  #     end
  #
  #     it 'does not allow duplicate email address' do
  #       pending
  #       user2 = FactoryGirl.create(:user2)
  #       user2.should_not be_valid
  #     end
  #
  #     it 'is invalid without an email' do
  #       user.email = nil
  #       expect(user).not_to be_valid
  #
  #     end
  #
  #     it 'is invalid without a first name' do
  #       user.email = 'sample@yo.com'
  #        user.first_name = nil
  #       expect(user).not_to be_valid
  #
  #     end
  #
  #     it 'is invalid without a last name' do
  #       user.first_name = 'user1'
  #       user.last_name = nil
  #       # user.should_not be_valid
  #       expect(user).not_to be_valid
  #
  #       end
  #     it 'is invalid without a last name' do
  #       user.first_name = 'user1'
  #       user.last_name = nil
  #       expect(user).not_to be_valid
  #
  #     end
  #
  #     it 'returns a full name of the user' do
  #
  #        expect(user.combined_name) === 'first_name last_name'
  #     end
  #
  #
  #   end
  #
  #
  #
  # end
