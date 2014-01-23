require 'spec_helper'

describe EmailAddress do
  let(:email_address) { EmailAddress.new(address: "alice.smith@smith.com", person_id: 1) }

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is invalid without an address' do
    email_address.address = nil
    expect(email_address).to_not be_valid
  end

  it 'is associated with a person' do
    expect(email_address).to respond_to(:person)
  end

  it 'must be associated with a person' do
    email_address.person_id = nil
    expect(email_address).to_not be_valid
  end
end
