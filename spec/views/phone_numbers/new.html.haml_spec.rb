require 'spec_helper'

describe "phone_numbers/new" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      first_name: "MyString",
      last_name: "MyString",
      id: 1
    ))
    assign(:phone_number, stub_model(PhoneNumber,
      :number => "MyString",
      :person_id => @person.id,
      :person => @person
    ).as_new_record)
  end

  it "renders new phone_number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do
      assert_select "input#phone_number_number[name=?]", "phone_number[number]"
      assert_select "input#phone_number_person_id[name=?]", "phone_number[person_id]"
    end
  end
end
