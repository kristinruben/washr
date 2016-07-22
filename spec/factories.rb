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

  factory :review do
    association :laundromat
    association :user
    rating 10
    description 'Great laundromat!'
    upvotes 5
    downvotes 3
  end

  factory :comment do
    association :user
    association :review
    sequence (:body) { |n| "Amazing comment #{n}" }
  end
end
