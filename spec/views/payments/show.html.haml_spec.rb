require 'rails_helper'

RSpec.describe "payments/show", :type => :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :swimmer => nil,
      :details => "MyText",
      :amount => "9.99",
      :paid => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
  end
end
