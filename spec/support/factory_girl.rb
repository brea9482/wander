require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "username#{n}" }
    password 'password'
    password_confirmation 'password'
  end

  factory :playlist do
    sequence(:name) { |n| "name#{n}" }
    description 'description'

    user
  end

end
