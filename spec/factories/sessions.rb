FactoryGirl.define do
  trait :bad_session do
    session_start 10.days.from_now
    session_end 12.days.from_now
  end

  trait :reverse_time do
    session_start DateTime.new(2011,01,01) + 1.hour
    session_end DateTime.new(2011,01,01) + 10.minutes
  end

  trait :noon_to_two do
    session_start DateTime.new(2011,01,01,12,0)
    session_end DateTime.new(2011,01,01,14,0) 
  end

  factory :session_noon_to_two, :parent => :session do
    noon_to_two
  end

  trait :noon_to_one do
    session_start DateTime.new(2011,01,01,12,0)
    session_end DateTime.new(2011,01,01,13,0) 
  end

  factory :session_noon_to_one, :parent => :session do
    noon_to_one
  end


  trait :one_to_two do
    session_start DateTime.new(2011,01,01,13,0)
    session_end DateTime.new(2011,01,01,14,0) 
  end
  
  factory :session_one_to_two, :parent => :session do
    one_to_two
  end


  trait :one_to_three do
    session_start DateTime.new(2011,01,01,13,0)
    session_end DateTime.new(2011,01,01,15,0) 
  end

  factory :session_one_to_three, :parent => :session do
    one_to_three
  end


  trait :eleven_to_noon do
    session_start DateTime.new(2011,01,01,11,0)
    session_end DateTime.new(2011,01,01,12,0) 
  end

  factory :session_eleven_to_noon, :parent => :session do
    eleven_to_noon
  end


  trait :eleven_to_one do
    session_start DateTime.new(2011,01,01,11,0)
    session_end DateTime.new(2011,01,01,12,0) 
  end

  factory :session_eleven_to_one, :parent => :session do
    eleven_to_one
  end


  trait :eleven_to_three do
    session_start DateTime.new(2011,01,01,11,0)
    session_end DateTime.new(2011,01,01,15,0) 
  end

  factory :session_eleven_to_three, :parent => :session do
    eleven_to_three
  end

    
  trait :halfpasttwelve_to_halfpastone do
    session_start DateTime.new(2011,01,01,12,30)
    session_end DateTime.new(2011,01,01,13,30) 
  end

  factory :session_halfpasttwelve_to_halfpastone, :parent => :session do
    halfpasttwelve_to_halfpastone
  end
  
  trait :two_to_three do
    session_start DateTime.new(2011,01,01,14,0)
    session_end DateTime.new(2011,01,01,15,0) 
  end


  factory :session_two_to_three, :parent => :session do
    two_to_three
  end

  

  factory :session do
    description "The first session of 'Teach Me Not To Suck'"
    session_start DateTime.new(2012,1,1) + 2.hours
    session_end  DateTime.new(2012,1,1) + 3.hours
    association :course
    association :location
  end




end
