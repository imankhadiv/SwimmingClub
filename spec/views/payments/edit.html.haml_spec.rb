# require 'rails_helper'
#
# RSpec.describe "payments/edit", :type => :view do
#   before(:each) do
#     @payment = assign(:payment, Payment.create!(
#       :swimmer => nil,
#       :details => "MyText",
#       :amount => "9.99",
#       :paid => false
#     ))
#   end
#
#   it "renders the edit payment form" do
#     render
#
#     assert_select "form[action=?][method=?]", payment_path(@payment), "post" do
#
#       assert_select "input#payment_swimmer_id[name=?]", "payment[swimmer_id]"
#
#       assert_select "textarea#payment_details[name=?]", "payment[details]"
#
#       assert_select "input#payment_amount[name=?]", "payment[amount]"
#
#       assert_select "input#payment_paid[name=?]", "payment[paid]"
#     end
#   end
# end
