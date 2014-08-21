require 'rails_helper'

RSpec.describe "swimming_records/show", :type => :view do
  before(:each) do
    @swimming_record = assign(:swimming_record, SwimmingRecord.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :gender => "Gender",
      :stroke => "Stroke",
      :distance => 1,
      :level => "Level",
      :meet => "Meet",
      :venue => "Venue",
      :time => 2,
      :age => 3,
      :region => "Region",
      :region => "Region",
      :region_code => "Region Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Stroke/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Level/)
    expect(rendered).to match(/Meet/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Region/)
    expect(rendered).to match(/Region/)
    expect(rendered).to match(/Region Code/)
  end
end
