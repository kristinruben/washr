require 'rails_helper'

feature 'user creates dryer' do
  let(:laundromat) { FactoryGirl.create(:laundromat) }
  let(:dryer) { FactoryGirl.create(:dryer) }

  context 'authenticated user' do
    before do
      sign_in
    end

    scenario 'visits new dryer form' do
      visit "/laundromats/#{laundromat.id}/dryers/new"

      expect(page).to have_selector('form')

      expect(page).to have_content('Number of Dryers Currently Available')

    end

    scenario 'inputs valid number' do
      visit "/laundromats/#{laundromat.id}/dryers/new"
      select dryer[:number_available]
      click_button 'Create Dryer'

      expect(page).to have_content('Dryer data successfully added!')
    end
  end

  context 'inauthenticated user' do

    scenario 'user visits new dryer form' do
      visit "/laundromats/#{laundromat.id}/dryers/new"
      expect(page).to have_content('You must be signed in to add washer data')

    end
  end
end
