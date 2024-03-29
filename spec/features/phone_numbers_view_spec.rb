require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the phone numbers view', type: :feature do
  describe 'from Person view' do
    let(:person) { FactoryGirl.create(:person) }
    let(:user) { person.user }

    before(:each) do
      person.phone_numbers.create(number: "555-1234")
      person.phone_numbers.create(number: "555-5678")
      login_as(user)
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
    let(:company) { FactoryGirl.create(:company) }
    let(:user) { company.user }

    before(:each) do
      company.phone_numbers.create(number: "555-1234")
      company.phone_numbers.create(number: "555-5678")
      login_as(user)
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
