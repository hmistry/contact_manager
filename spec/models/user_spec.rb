require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it 'has associated people' do
    expect(user.people).to eq([])
  end

  it 'builds associated people' do
    person_1 = FactoryGirl.create(:person)
    person_2 = FactoryGirl.create(:person)
    [person_1, person_2].each do |person|
      expect(user.people).not_to include(person)
      user.people << person
      expect(user.people).to include(person)
    end
  end

  it 'has associated companies' do
    expect(user.companies).to eq([])
  end

  it 'builds associated companies' do
    company_1 = FactoryGirl.create(:company)
    company_2 = FactoryGirl.create(:company)
    [company_1, company_2].each do |company|
      expect(user.companies).not_to include(company)
      user.companies << company
      expect(user.companies).to include(company)
    end
  end
end
