require 'rails_helper'

RSpec.describe "payments/index", :type => :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :swimmer => nil,
        :details => "MyText",
        :amount => "9.99",
        :paid => false
      ),
      Payment.create!(
        :swimmer => nil,
        :details => "MyText",
        :amount => "9.99",
        :paid => false
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
