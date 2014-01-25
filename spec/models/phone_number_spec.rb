require 'spec_helper'

describe PhoneNumber do
  let(:phone_number) {PhoneNumber.new(number: "1112223333", contact_id: 1, contact_type: "Person")}

  it "is valid" do
    expect(phone_number).to be_valid
  end

  it "is not valid without a number" do
    phone_number.number = nil
    expect(phone_number).not_to be_valid
  end

  it "is not valid without a contact_type" do
    phone_number.contact_type = nil
    expect(phone_number).not_to be_valid
  end

  it "must be referenced to a contact" do
    phone_number.contact_id = nil
    expect(phone_number).not_to be_valid
  end

  it "is associated with a contact" do
    expect(phone_number).to respond_to(:contact)
  end
end
