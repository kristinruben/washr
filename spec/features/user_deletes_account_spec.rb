require 'rails_helper'

feature 'user edits account information' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:another_user) { FactoryGirl.create(:user) }
  let!(:laundromat) { FactoryGirl.create(:laundromat) }

  before do
    visit laundromats_path
    click_link 'Sign In'
    fill_in 'Email', with: user[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Edit Account'
  end

  scenario 'user deletes account' do
    click_button 'Cancel my account'

    expect(page).to have_content('Your account has been successfully cancelled')
    expect(User.all.count).to eq(1)
  end
end
