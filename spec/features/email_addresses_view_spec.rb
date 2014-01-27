require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the email addresses view', type: :feature do
  describe 'from Person view' do
    let(:person) { Person.create(first_name: 'Jane', last_name: 'Doe') }

    describe 'when looking at the new email address form' do
      before(:each) do
        visit person_path(person)
        page.click_link('new_email_address')
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{person.last_name}, #{person.first_name}")
      end
    end
  end

  describe 'from Company view' do
    let(:company) { Company.create(name: 'Acme') }

    describe 'when looking at the new email address form' do
      before(:each) do
        visit company_path(company)
        page.click_link('new_email_address')
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{company.name}")
      end
    end
  end

end
