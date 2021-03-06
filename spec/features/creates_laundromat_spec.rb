require 'rails_helper'

feature 'user creates laundromat' do
  let(:laundromat) { FactoryGirl.attributes_for(:laundromat) }

  context 'inauthenticated user' do
    scenario 'unauthorized user visits new laundromat form' do
      visit laundromats_path

      click_link 'Add New Laundromat'

      expect(page).to have_content('You must be signed in to add a new laundromat')

      expect(page).not_to have_selector('form')
    end
  end

  context 'authenticated user' do
    before do
      sign_in
    end

    scenario 'visits new laundromat form' do
      click_link 'Add New Laundromat'

      expect(page).to have_selector('form')

      expect(page).to have_content('Laundromat Name')
      expect(page).to have_content('Address')
      expect(page).to have_content('City')
      expect(page).to have_content('State')
      expect(page).to have_content('Zip Code')
    end

    scenario 'inputs valid name, location' do
      click_link 'Add New Laundromat'
      fill_in 'Laundromat Name', with: laundromat[:name]
      fill_in 'Address', with: laundromat[:address]
      fill_in 'City', with: laundromat[:city]
      select 'Massachusetts', from: 'State'
      fill_in 'Zip', with: laundromat[:zip_code]
      click_button 'Add Laundromat'

      expect(page).to have_content('Laundromat successfully added!')
      expect(page).to have_content(laundromat[:name])
    end

    scenario 'does not complete required fields' do
      click_link 'Add New Laundromat'
      fill_in 'Name', with: ''
      fill_in 'Address', with: ''
      fill_in 'City', with: laundromat[:city]
      select 'Massachusetts', from: 'State'
      fill_in 'Zip Code', with: ''
      click_button 'Add Laundromat'

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Address can't be blank")

      expect(page).not_to have_content('Laundromat successfully added!')

      expect(page).to have_content('There were problems saving your laundromat')
    end

    scenario 'submits a blank form' do
      click_link 'Add New Laundromat'

      click_button 'Add Laundromat'

      expect(page).not_to have_content('Laundromat successfully added!')
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content('There were problems saving your laundromat')
    end
  end
end
