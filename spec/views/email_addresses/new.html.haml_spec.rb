require 'spec_helper'

describe "email_addresses/new" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      first_name: "MyString",
      last_name: "MyString",
      id: 1
    ))
    assign(:email_address, stub_model(EmailAddress,
      :address => "MyString",
      :contact_id => 1,
      :contact_type => "Person",
      person: @person
    ).as_new_record)
  end

  it "renders new email_address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_addresses_path, "post" do
      assert_select "input#email_address_address[name=?]", "email_address[address]"
      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"
      assert_select "input#email_address_contact_type[name=?]", "email_address[contact_type]"
    end
  end
end
