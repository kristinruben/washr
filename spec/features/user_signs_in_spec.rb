require 'rails_helper'

feature 'user creates account' do
  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.attributes_for(:user) }
  let!(:laundromat) { FactoryGirl.create(:laundromat) }

  scenario 'user sees sign in form' do
    visit laundromats_path
    click_link 'Sign In'

    expect(current_path).to eq(new_user_session_path)

    expect(page).to have_selector('form')

    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Log in')
  end

  scenario 'user inputs correct fields' do
    visit laundromats_path
    click_link 'Sign In'
    fill_in 'Email', with: user[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(current_path).to eq(root_path)

    expect(page).to have_content('Signed in successfully')

    expect(page).not_to have_link('Sign In')
    expect(page).not_to have_link('Sign Up')
  end

  scenario 'user inputs incorrect fields' do
    visit laundromats_path
    click_link 'Sign In'
    fill_in 'Email', with: another_user[:email]
    fill_in 'Password', with: another_user[:password]
    click_button 'Log in'

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'user leaves out required fields' do
    visit laundromats_path
    click_link 'Sign In'
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Log in'

    expect(page).to have_content('Invalid Login or password')
  end
end
