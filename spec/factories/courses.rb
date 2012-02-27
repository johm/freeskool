FactoryGirl.define do
  factory :course do
    name "Test Course"
    short_description "A course for testing the Course class"
    long_description <<-EOS
      Intrinsicly pursue optimal initiatives whereas high standards in experiences. Holisticly fashion orthogonal platforms before equity invested synergy. Compellingly synthesize prospective resources via team building customer service. 

      Enthusiastically visualize transparent scenarios through top-line sources. Efficiently initiate progressive meta-services with strategic best practices.
      EOS
    is_approved false
    association :instructor, :factory=>:user
  end
end
