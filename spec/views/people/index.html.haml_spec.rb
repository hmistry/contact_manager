require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :first_name => "FirstName",
        :last_name => "LastName"
      ),
      stub_model(Person,
        :first_name => "FirstName",
        :last_name => "LastName"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "LastName, FirstName".to_s, :count => 2
  end
end
