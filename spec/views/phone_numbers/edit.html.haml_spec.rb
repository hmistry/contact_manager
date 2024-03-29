require 'spec_helper'

describe "phone_numbers/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      first_name: "MyString",
      last_name: "MyString"
    ))
    @phone_number = assign(:phone_number, stub_model(PhoneNumber,
      :number => "MyString",
      :contact_id => @person.id,
      :contact_type => "Person",
      :contact => @person
    ))
  end

  it "renders the edit phone_number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do
      assert_select "input#phone_number_number[name=?]", "phone_number[number]"
      assert_select "input#phone_number_contact_id[name=?]", "phone_number[contact_id]"
      assert_select "input#phone_number_contact_type[name=?]", "phone_number[contact_type]"
    end
  end
end
