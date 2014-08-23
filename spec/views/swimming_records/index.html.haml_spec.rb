# require 'rails_helper'
#
# RSpec.describe "swimming_records/index", :type => :view do
#   before(:each) do
#     assign(:swimming_records, [
#       SwimmingRecord.create!(
#         :first_name => "First Name",
#         :last_name => "Last Name",
#         :gender => "Gender",
#         :stroke => "Stroke",
#         :distance => 1,
#         :level => "Level",
#         :meet => "Meet",
#         :venue => "Venue",
#         :time => 2,
#         :age => 3,
#         :region => "Region",
#         :region => "Region",
#         :region_code => "Region Code"
#       ),
#       SwimmingRecord.create!(
#         :first_name => "First Name",
#         :last_name => "Last Name",
#         :gender => "Gender",
#         :stroke => "Stroke",
#         :distance => 1,
#         :level => "Level",
#         :meet => "Meet",
#         :venue => "Venue",
#         :time => 2,
#         :age => 3,
#         :region => "Region",
#         :region => "Region",
#         :region_code => "Region Code"
#       )
#     ])
#   end
#
#   it "renders a list of swimming_records" do
#     render
#     assert_select "tr>td", :text => "First Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Last Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Gender".to_s, :count => 2
#     assert_select "tr>td", :text => "Stroke".to_s, :count => 2
#     assert_select "tr>td", :text => 1.to_s, :count => 2
#     assert_select "tr>td", :text => "Level".to_s, :count => 2
#     assert_select "tr>td", :text => "Meet".to_s, :count => 2
#     assert_select "tr>td", :text => "Venue".to_s, :count => 2
#     assert_select "tr>td", :text => 2.to_s, :count => 2
#     assert_select "tr>td", :text => 3.to_s, :count => 2
#     assert_select "tr>td", :text => "Region".to_s, :count => 2
#     assert_select "tr>td", :text => "Region".to_s, :count => 2
#     assert_select "tr>td", :text => "Region Code".to_s, :count => 2
#   end
# end
