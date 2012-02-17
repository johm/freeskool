FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.org"}
    password "password"
  end
end