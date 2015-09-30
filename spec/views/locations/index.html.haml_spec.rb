require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :name => "Name",
        :symbol => "Symbol",
        :location_type => "Location Type"
      ),
      Location.create!(
        :name => "Name",
        :symbol => "Symbol",
        :location_type => "Location Type"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
    assert_select "tr>td", :text => "Location Type".to_s, :count => 2
  end
end
