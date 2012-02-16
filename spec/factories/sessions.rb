FactoryGirl.define do
  trait :bad_session do
    session_start 10.days.from_now
    session_end 12.days.from_now
  end
  
  factory :session do
    
    description "The first session of 'Teach Me Not To Suck'"
    session_start 2.weeks.from_now
    session_end   2.weeks.from_now + 1.hour
    association :course
    association :location
  end
end