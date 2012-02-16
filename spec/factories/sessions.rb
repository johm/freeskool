FactoryGirl.define do
  factory :session do
    
    description "The first session of 'Teach Me Not To Suck'"
    session_date  2.weeks.from_now.to_date
    session_start 2.weeks.from_now
    session_end   2.weeks.from_now + 1.hour
    association :course
    association :location
  end
end