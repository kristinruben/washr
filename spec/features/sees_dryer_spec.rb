require 'rails_helper'

feature 'user creates laundromat' do
  let(:laundromat) { FactoryGirl.create(:laundromat) }
  let(:dryer) { FactoryGirl.create(:dryer) }

  context 'authenticated user' do
    before do
      sign_in
    end

  scenario 'sees dryers on a given show page' do
    visit "/laundromats/#{laundromat.id}/dryers/new"

    expect(page).to have_content('Add New Dryer Data')
    expect(page).to have_content('Number of Dryers Currently Available')
    expect(page).to have_button('Create Dryer')

  end

  scenario 'user sees no dryers' do
    visit new_laundromat_washer_path(laundromat.id)

    expect(page).not_to have_content(dryer)
  end
end
end
