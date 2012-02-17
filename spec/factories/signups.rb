FactoryGirl.define do
  factory :signup do
    association :course
    association :user
  end
  
end