require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :name => "MyString",
      :symbol => "MyString",
      :location_type => "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_name[name=?]", "location[name]"

      assert_select "input#location_symbol[name=?]", "location[symbol]"

      assert_select "input#location_location_type[name=?]", "location[location_type]"
    end
  end
end
