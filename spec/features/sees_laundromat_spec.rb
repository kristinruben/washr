require 'rails_helper'

feature 'user sees laundromats' do
  scenario 'see all the laundromats' do
    laundromat = FactoryGirl.create(:laundromat, name: 'ZZZZ')
    another_laundromat = FactoryGirl.create(:laundromat, name: 'AAAA')
    FactoryGirl.create(:laundromat, name: 'DDDD')

    visit laundromats_path

    expect(page).to have_content('Laundromats')
    expect(page).to have_content(laundromat.name)
    expect(page).to have_selector('.laundromat', count: 3)

    expect(page).to have_link(laundromat.name)

    expect(page).to have_content(laundromat.name)
    expect(page).to have_content(another_laundromat.name)
    expect(find('.laundromat:first-of-type').text).to include(another_laundromat.name)
  end

  scenario 'user sees no laundromats' do
    visit laundromats_path

    expect(page).not_to have_selector('.laundromat')
  end
end
