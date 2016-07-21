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

      expect(current_path).to eq(new_laundromat_path)

      expect(page).to have_selector('form')

      expect(page).to have_content('Laundromat Name')
      expect(page).to have_content('Street')
      expect(page).to have_content('City')
      expect(page).to have_content('State')
    end

    scenario 'inputs valid name, location, and category' do
      click_link 'Add New Laundromat'
      fill_in 'Laundromat Name', with: laundromat[:name]
      fill_in 'Street', with: laundromat[:street]
      fill_in 'City', with: laundromat[:city]
      select 'Massachusetts', from: 'State'
      click_button 'Add Laundromat'

      expect(current_path).to eq("/laundromats/#{Laundromat.first.id}")
      expect(page).to have_content('Laundromat successfully added!')
      expect(page).to have_content(laundromat[:name])
    end

    scenario 'does not complete required fields' do
      click_link 'Add New Laundromat'
      fill_in 'Name', with: ''
      fill_in 'Street', with: ''
      fill_in 'City', with: laundromat[:city]
      select 'Massachusetts', from: 'State'
      click_button 'Add Laundromat'

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street can't be blank")

      expect(page).not_to have_content('Laundromat successfully added!')

      expect(page).to have_content('There were problems saving your laundromat')

      expect(find('#laundromat_city').value).to eq(laundromat[:city])
    end

    scenario 'submits a blank form' do
      click_link 'Add New Laundromat'
      click_button 'Add Laundromat'

      expect(page).not_to have_content('Laundromat successfully added!')
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content('There were problems saving your laundromat')
    end
  end
end
