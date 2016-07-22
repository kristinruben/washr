require 'rails_helper'

feature 'user edits laundromat' do
  let(:laundromat) { FactoryGirl.create(:laundromat) }
  let(:new_laundromat) { FactoryGirl.build(:laundromat) }

  context 'inauthenticated user' do
    scenario 'cannot edit laundromat' do
      visit laundromat_path(laundromat)

      expect(page).not_to have_link('Edit Laundromat')
    end
  end

  context 'authenticated user' do
    before do
      sign_in
    end

    scenario 'visits edit laundromat form' do
      visit laundromat_path(laundromat)
      click_link 'Edit Laundromat'

      expect(current_path).to eq(edit_laundromat_path(laundromat))

      expect(page).to have_selector('form')

      expect(page).to have_content('Laundromat Name')
      expect(page).to have_content('Street')
      expect(page).to have_content('City')
      expect(page).to have_content('State')
      expect(page).to have_content('Laundromat Website')
      expect(page).to have_content('Laundromat Category')
      expect(page).to have_content('Description')

      expect(find('#laundromat_name').value).to eq(laundromat[:name])
      expect(find('#laundromat_address').value).to eq(laundromat[:address])
      expect(find('#laundromat_city').value).to eq(laundromat[:city])
      expect(find('#laundromat_zip_code').value).to eq(laundromat[:zip_code])
      expect(find('#laundromat_category_music').value).to eq(laundromat[:category])
      expect(find('#laundromat_description').value).to eq(laundromat[:description])
    end

    scenario 'inputs valid name, location, and category' do
      visit laundromat_path(laundromat)
      click_link 'Edit Laundromat'

      fill_in 'Laundromat Name', with: new_laundromat[:name]
      fill_in 'Street', with: new_laundromat[:address]
      fill_in 'City', with: new_laundromat[:city]
      select 'Massachusetts', from: 'State'
      fill_in 'Zip Code', with: new_laundromat[:zip_code]
      choose 'laundromat_category_comedy'
      fill_in 'laundromat_description', with: new_laundromat[:description]
      click_button 'Save Changes'

      expect(current_path).to eq(laundromat_path(laundromat))

      expect(page).to have_content('Laundromat successfully saved!')
      expect(page).to have_content(new_laundromat[:name])

      expect(page).not_to have_content(laundromat[:name])
    end

    scenario 'does not complete required fields' do
      visit laundromat_path(laundromat)
      click_link 'Edit Laundromat'

      fill_in 'Name', with: ''
      fill_in 'Address', with: ''
      fill_in 'City', with: new_laundromat[:city]
      select 'Massachusetts', from: 'State'
      fill_in 'Zip Code', with: ''
      click_button 'Save Changes'

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street can't be blank")

      expect(page).not_to have_content('Laundromat successfully saved!')

      expect(page).to have_content('There were problems saving your laundromat')

      expect(find('#laundromat_city').value).to eq(new_laundromat[:city])
      expect(find('#laundromat_website').value).to eq(new_laundromat[:website])
      expect(find('#laundromat_description').value).to eq(new_laundromat[:description])
    end

    scenario 'submits a blank form' do
      visit laundromat_path(laundromat)
      click_link 'Edit Laundromat'

      fill_in 'Name', with: ''
      fill_in 'Street', with: ''
      fill_in 'City', with: ''
      select 'Select a State', from: 'State'
      click_button 'Save Changes'

      expect(page).not_to have_content('Laundromat successfully added!')

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content('There were problems saving your laundromat')
    end
  end
end
