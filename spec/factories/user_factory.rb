FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password "password"

    trait :admin do
      admin true
    end
  end
end
