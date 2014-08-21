require 'rails_helper'

RSpec.describe "swimming_records/new", :type => :view do
  before(:each) do
    assign(:swimming_record, SwimmingRecord.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :gender => "MyString",
      :stroke => "MyString",
      :distance => 1,
      :level => "MyString",
      :meet => "MyString",
      :venue => "MyString",
      :time => 1,
      :age => 1,
      :region => "MyString",
      :region => "MyString",
      :region_code => "MyString"
    ))
  end

  it "renders new swimming_record form" do
    render

    assert_select "form[action=?][method=?]", swimming_records_path, "post" do

      assert_select "input#swimming_record_first_name[name=?]", "swimming_record[first_name]"

      assert_select "input#swimming_record_last_name[name=?]", "swimming_record[last_name]"

      assert_select "input#swimming_record_gender[name=?]", "swimming_record[gender]"

      assert_select "input#swimming_record_stroke[name=?]", "swimming_record[stroke]"

      assert_select "input#swimming_record_distance[name=?]", "swimming_record[distance]"

      assert_select "input#swimming_record_level[name=?]", "swimming_record[level]"

      assert_select "input#swimming_record_meet[name=?]", "swimming_record[meet]"

      assert_select "input#swimming_record_venue[name=?]", "swimming_record[venue]"

      assert_select "input#swimming_record_time[name=?]", "swimming_record[time]"

      assert_select "input#swimming_record_age[name=?]", "swimming_record[age]"

      assert_select "input#swimming_record_region[name=?]", "swimming_record[region]"

      assert_select "input#swimming_record_region[name=?]", "swimming_record[region]"

      assert_select "input#swimming_record_region_code[name=?]", "swimming_record[region_code]"
    end
  end
end
