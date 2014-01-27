require 'spec_helper'

describe Company do
  let(:company) { Company.new(name: "MyCompany") }

  it "is valid" do
    expect(company).to be_valid
  end

  it "is invalid without a name" do
    company.name = nil
    expect(company).to_not be_valid
  end

  it 'has an array of phone numbers' do
    expect(company.phone_numbers).to eq([])
  end

  it "responds with its phone numbers after they're created" do
    company.phone_numbers.build(number: "333-4444")
    expect(company.phone_numbers.map(&:number)).to eq(['333-4444'])
  end

  it "responds with its email addresses after they're created" do
    company.email_addresses.build(address: "info@abc.com")
    expect(company.email_addresses.map(&:address)).to eq(["info@abc.com"])
  end

  it "converts to string with company name" do
    expect(company.to_s).to eq("MyCompany")
  end
end
