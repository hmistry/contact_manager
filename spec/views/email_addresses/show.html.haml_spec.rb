require 'spec_helper'

describe "email_addresses/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      first_name: "MyString",
      last_name: "MyString",
      id: 1
    ))
    @email_address = assign(:email_address, stub_model(EmailAddress,
      :address => "Address",
      :contact_id => 1,
      :contact_type => "Person",
      person: @person
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    rendered.should match(/1/)
  end
end
