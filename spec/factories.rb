FactoryGirl.define do

  factory :user do
    sequence(:username) { |n| "dparton#{n}" }
    sequence(:email) { |n| "dparton#{n}@gmail.com" }
    password 'password'
  end

  factory :laundromat do
    sequence (:name) { |n| "Laundromat #{n}" }
    sequence (:address) { |n| "Street #{n}" }
    city 'Boston'
    state 'MA'
    website 'http://www.laundromat.com'
    category 'Music'
    description 'The greatest laundromat of all time'
    avg_rating '8'
  end
end
