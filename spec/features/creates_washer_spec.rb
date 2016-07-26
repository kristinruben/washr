require 'rails_helper'

feature 'user creates washer' do
  let(:laundromat) { FactoryGirl.create(:laundromat) }
  let(:washer) { FactoryGirl.create(:washer) }

  context 'authenticated user' do
    before do
      sign_in
    end

  scenario 'visits new washer form' do
    visit "/laundromats/#{laundromat.id}/washers/new"

    expect(page).to have_selector('form')

    expect(page).to have_content('Number of Washers Currently Available')

  end

  scenario 'inputs valid number' do
    visit "/laundromats/#{laundromat.id}/washers/new"
    select washer[:number_available]
    click_button 'Create Washer'

    expect(page).to have_content('Washer data successfully added!')
  end

end
end
