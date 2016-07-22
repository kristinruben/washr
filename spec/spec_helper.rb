require 'coveralls'
Coveralls.wear!('rails')
# require 'support/factory_girl'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def sign_in
    user = FactoryGirl.create(:user)
    visit laundromats_path
    click_link 'Sign In'
    fill_in 'Username', with: user[:username]
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end
