require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the phone numbers view', type: :feature do
  describe 'from Person view' do
    let(:person) { Person.create(first_name: 'Jane', last_name: 'Doe') }

    before(:each) do
      person.phone_numbers.create(number: "555-1234")
      person.phone_numbers.create(number: "555-5678")
      visit person_path(person)
    end

    describe 'when looking at the new phone numbers form' do
      before(:each) do
        page.click_link('new_phone_number')
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{person.last_name}, #{person.first_name}")
      end
    end

    describe 'when looking at the edit phone numbers form' do
      before(:each) do
        page.first(:link, 'edit').click
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{person.last_name}, #{person.first_name}")
      end
    end
  end

  describe 'from Company view' do
    let(:company) { Company.create(name: 'Acme') }

    before(:each) do
      company.phone_numbers.create(number: "555-1234")
      company.phone_numbers.create(number: "555-5678")
      visit company_path(company)
    end

    describe 'when looking at the new phone numbers form' do
      before(:each) do
        page.click_link('new_phone_number')
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{company.name}")
      end
    end

    describe 'when looking at the edit phone numbers form' do
      before(:each) do
        page.first(:link, 'edit').click
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{company.name}")
      end
    end
  end

end
