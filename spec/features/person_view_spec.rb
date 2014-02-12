require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the person view', type: :feature do

  let(:person) { FactoryGirl.create(:person) }
  let(:user) { person.user }


  describe 'regarding phone numbers' do
    before(:each) do
      person.phone_numbers.create(number: "555-1234")
      person.phone_numbers.create(number: "555-5678")
      login_as(user)
      visit person_path(person)
    end

    it 'shows the phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add another' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: person.id, contact_type: "Person"))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      # page.fill_in('Person', with: "#{person.id}")
      page.click_button('Create Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'has links to delete phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone))
      end
    end

    it 'deletes a phone number' do
      first(:link, 'delete').click
      expect(current_path).to eq(person_path(person))
      expect(page).to_not have_content('555-1234')
    end
  end

  describe 'regarding email address' do
    before(:each) do
      person.email_addresses.create(address: "jdoe@doe.com")
      person.email_addresses.create(address: "john@doe.com")
      login_as(user)
      visit person_path(person)
    end

    it 'shows the email address in a list' do
      person.email_addresses.each do |email_address|
        expect(page).to have_selector('li', text: email_address.address)
      end
    end

    it 'has link to add new email address' do
      expect(page).to have_link('new_email_address', href: new_email_address_path(contact_id: person.id, contact_type: "Person"))
    end

    it 'adds an email address' do
      page.click_link('new_email_address')
      page.fill_in('Address', with: 'jd@gaga.com')
      page.click_button('Create Email address')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('jd@gaga.com')
    end

    it 'has links to edit email address' do
      person.email_addresses.each do |email|
        expect(page).to have_link('edit_email', href: edit_email_address_path(email))
      end
    end

    it 'edits an email address' do
      email = person.email_addresses.first
      old_email = email.address

      first(:link, 'edit_email').click
      page.fill_in('Address', with: 'jd@gaga.com')
      page.click_button('Update Email address')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('jd@gaga.com')
      expect(page).to_not have_content(old_email)
    end

    it 'has links to delete email address' do
      person.email_addresses.each do |email|
        expect(page).to have_link('delete_email', href: email_address_path(email))
      end
    end

    it 'deletes an email address' do
      first(:link, 'delete_email').click
      expect(current_path).to eq(person_path(person))
      expect(page).to_not have_content('jdoe@doe.com')
    end
  end
end
