require 'rails_helper'

feature 'user deletes laundromat' do
  let!(:laundromat) { FactoryGirl.create(:laundromat) }
  let!(:another_laundromat)  { FactoryGirl.create(:laundromat) }

  scenario 'authenticated user deletes laundromat from show page' do
    sign_in

    visit laundromat_path(laundromat)
    page.find('.delete').click

    expect(Laundromat.all.count).to eq(1)

    expect(current_path).to eq(laundromats_path)
    expect(page).not_to have_content(laundromat.name)
    expect(page).to have_content(another_laundromat.name)
  end

  scenario 'inauthenticated user cannot delete laundromat' do
    visit laundromat_path(laundromat)

    expect(page).not_to have_selector('delete')
  end
end
