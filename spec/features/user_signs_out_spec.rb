require 'rails_helper'

feature 'user creates account' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:laundromat) { FactoryGirl.create(:laundromat) }

  scenario 'user signs out' do
    visit laundromats_path
    click_link 'Sign In'
    fill_in 'Email', with: user[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully')
    expect(page).to have_link('Sign In')

    expect(page).not_to have_link('Sign Out')
  end
end
