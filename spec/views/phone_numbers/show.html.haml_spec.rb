require 'spec_helper'

describe "phone_numbers/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      first_name: "MyString",
      last_name: "MyString",
      id: 1
    ))
    @phone_number = assign(:phone_number, stub_model(PhoneNumber,
      :number => "MyString",
      :person_id => @person.id,
      :person => @person
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/1/)
  end
end
