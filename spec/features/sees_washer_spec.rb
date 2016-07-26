require 'rails_helper'

feature 'user creates laundromat' do
  let(:laundromat) { FactoryGirl.create(:laundromat) }
  let(:washer) { FactoryGirl.create(:washer) }

  context 'authenticated user' do
    before do
      sign_in
    end

  scenario 'sees washers on a given show page' do
    visit "/laundromats/#{laundromat.id}/washers/new"

    expect(page).to have_content('Add New Washer Data')
    expect(page).to have_content('Number of Washers Currently Available')
    expect(page).to have_button('Create Washer')

  end
  #
  # scenario 'user sees no washers' do
  #   visit new_laundromat_washer
  #
  #   expect(page).not_to have_content(washer)
  # end
end
end
