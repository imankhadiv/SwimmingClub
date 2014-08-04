# require 'rails_helper'
#
# RSpec.describe "events/new", :type => :view do
#   before(:each) do
#     assign(:event, Event.new(
#       :title => "MyString",
#       :details => "MyString",
#       :user => nil,
#       :notification => false
#     ))
#   end
#
#   it "renders new event form" do
#     render
#
#     assert_select "form[action=?][method=?]", events_path, "post" do
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
