require 'spec_helper'


describe 'Swimmer Time'  do
  # let!(:swimmer) { FactoryGirl.create(:swimmer)}
  # let!(:swimmer_time) { FactoryGirl.create(:swimmer_time) }

  before(:each) do
    roles = FactoryGirl.create(:role);
    role = Role.create(name: 'Committee')
    user = FactoryGirl.create(:user)
    @swimmer = FactoryGirl.create(:swimmer)
    swimmer_time = FactoryGirl.create(:swimmer_time)
    user.roles << role
    user.approved = true
    login_as(user, :scope => :user)

  end

  # specify 'I can view the swimmer times page' do
  #
  #   visit swimmer_times_swimmer_path(@swimmer)
  #   save_and_open_page
  #   expect(page).to have_link 'Search'
  #
  #   # click_link 'Search'
  #   # print page.html
  #
  #   # expect(page).to have_content 'No Result Found'
  #   # page.should have_content 'No Result Found!'
  # end
#   #
#   #
#   # specify 'I can search for swimmer times' do
#   #   #pending
#   #
#   #   visit swimmer_times_path
#   #
#   #   expect(page).to have_link 'Search'
#   #
#   #   click_link 'Search'
#   #
#   #   page.should have_content :
#   # end

end

