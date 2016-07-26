require 'rails_helper'

feature 'user edits laundromat' do
  let(:laundromat) { FactoryGirl.create(:laundromat) }
  let(:new_laundromat) { FactoryGirl.build(:laundromat) }

  context 'inauthenticated user' do
    scenario 'cannot edit laundromat' do
      visit laundromat_path(laundromat)

      expect(page).not_to have_selector('edit')
    end
  end

  context 'authenticated user' do
    before do
      sign_in
    end

    scenario 'visits edit laundromat form' do
      visit laundromat_path(laundromat)
      page.find('.edit').click

      expect(page).to have_selector('form')

      expect(page).to have_content('Laundromat Name')
      expect(page).to have_content('Address')
      expect(page).to have_content('City')
      expect(page).to have_content('State')

      expect(find('#laundromat_name').value).to eq(laundromat[:name])
      expect(find('#laundromat_address').value).to eq(laundromat[:address])
      expect(find('#laundromat_city').value).to eq(laundromat[:city])
      expect(find('#laundromat_zip_code').value).to eq(laundromat[:zip_code])
    end

    scenario 'inputs valid name, location, and category' do
      visit laundromat_path(laundromat)
      page.find('.edit').click

      fill_in 'Laundromat Name', with: new_laundromat[:name]
      fill_in 'Address', with: new_laundromat[:address]
      fill_in 'City', with: new_laundromat[:city]
      select 'Massachusetts', from: 'State'
      fill_in 'Zip Code', with: new_laundromat[:zip_code]
      click_button 'Save Changes'

      expect(page).to have_content('Laundromat successfully saved!')
      expect(page).to have_content(new_laundromat[:name])

      expect(page).not_to have_content(laundromat[:name])
    end

    scenario 'does not complete required fields' do
      visit laundromat_path(laundromat)
      page.find('.edit').click

      fill_in 'Name', with: ''
      fill_in 'Address', with: ''
      fill_in 'City', with: new_laundromat[:city]
      select 'Massachusetts', from: 'State'
      fill_in 'Zip Code', with: ''
      click_button 'Save Changes'

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Address can't be blank")

      expect(page).not_to have_content('Laundromat successfully saved!')

      expect(page).to have_content('There were problems saving your laundromat')

      expect(find('#laundromat_city').value).to eq(new_laundromat[:city])
    end

    scenario 'submits a blank form' do
      visit laundromat_path(laundromat)
      page.find('.edit').click

      fill_in 'Name', with: ''
      fill_in 'Address', with: ''
      fill_in 'City', with: ''
      select 'Select a State', from: 'State'
      click_button 'Save Changes'

      expect(page).not_to have_content('Laundromat successfully added!')

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content('There were problems saving your laundromat')
    end
  end
end
