require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the email addresses view', type: :feature do
  describe 'from Person view' do
    let(:person) { FactoryGirl.create(:person) }
    let(:user) { person.user }

    before(:each) do
      person.email_addresses.create(address: "info@acme.com")
      person.email_addresses.create(address: "sale@acme.com")
      login_as(user)
      visit person_path(person)
    end

    describe 'when looking at the new email address form' do
      before(:each) do
        page.click_link('new_email_address')
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{person.last_name}, #{person.first_name}")
      end
    end

    describe 'when looking at the edit email address form' do
      before(:each) do
        page.first(:link, 'edit').click
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{person.last_name}, #{person.first_name}")
      end
    end
  end

  describe 'from Company view' do
    let(:company) { FactoryGirl.create(:company) }
    let(:user) { company.user }

    before(:each) do
      company.email_addresses.create(address: "info@acme.com")
      company.email_addresses.create(address: "sale@acme.com")
      login_as(user)
      visit company_path(company)
    end

    describe 'when looking at the new email address form' do
      before(:each) do
        page.click_link('new_email_address')
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{company.name}")
      end
    end

    describe 'when looking at the edit email address form' do
      before(:each) do
        page.first(:link, 'edit').click
      end

      it "shows the contact's name in the title" do
        expect(page).to have_selector("h1", text: "#{company.name}")
      end
    end
  end

end
