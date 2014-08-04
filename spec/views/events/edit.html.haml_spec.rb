# require 'rails_helper'
#
# RSpec.describe "events/edit", :type => :view do
#   before(:each) do
#     @event = assign(:event, Event.create!(
#       :title => "MyString",
#       :details => "MyString",
#       :user => nil,
#       :notification => false
#     ))
#   end
#
#   it "renders the edit event form" do
#     render
#
#     assert_select "form[action=?][method=?]", event_path(@event), "post" do
#
#       assert_select "input#event_title[name=?]", "event[title]"
#
#       assert_select "input#event_details[name=?]", "event[details]"
#
#       assert_select "input#event_user_id[name=?]", "event[user_id]"
#
#       assert_select "input#event_notification[name=?]", "event[notification]"
#     end
#   end
# end
