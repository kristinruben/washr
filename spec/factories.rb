FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "dparton#{n}@gmail.com" }
    password 'password'
  end

  factory :laundromat do
    sequence (:name) { |n| "Laundromat #{n}" }
    sequence (:address) { |n| "Street #{n}" }
    city 'Boston'
    state 'MA'
    zip_code '02138'
  end

  factory :washer do
    sequence (:number_available) { rand(0..15) }
    laundromat
  end

  factory :dryer do
    sequence (:number_available) { rand(0..15) }
    laundromat
  end
end
