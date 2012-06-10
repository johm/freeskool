require 'spec_helper'

describe Session do
  before(:each) do
    @session = Factory.build(:session)
  end
  
  it "should be valid" do
    @session.should be_valid
  end

  it "should not be possible to reverse the direction of time" do
    @reversed_session=Factory.build(:session,:reverse_time)
    @reversed_session.should_not be_valid
    @reversed_session.errors[:session_end].should include("must be later than session_start.")
  end

  it "should be able to detect overlapping sessions" do 
    @noon_to_two=Factory.create(:session_noon_to_two)

    @good_session_before=Factory.build(:session_eleven_to_noon)
    @good_session_after.session_temporally_included_in_other_session?.should be_false
    @good_session_after.session_temporally_includes_other_session?.should be_false
    @good_session_after.session_temporally_overlaps_earlier?.should be_false
    @good_session_after.session_temporally_overlaps_later?.should be_false
    @good_session_before.session_coincident_with_other_sessions?.should be_false

    @good_session_after=Factory.build(:session_two_to_three)
    @good_session_after.session_temporally_included_in_other_session?.should be_false
    @good_session_after.session_temporally_includes_other_session?.should be_false
    @good_session_after.session_temporally_overlaps_earlier?.should be_false
    @good_session_after.session_temporally_overlaps_later?.should be_false
    @good_session_after.session_coincident_with_other_sessions?.should be_false

    @bad_session_included=Factory.build(:session_halfpasttwelve_to_halfpastone)
    @bad_session_included.session_temporally_included_in_other_session?.should be_true
    @bad_session_included.session_coincident_with_other_sessions?.should be_true

    @bad_session_contains=Factory.build(:session_eleven_to_three)
    @bad_session_contains.session_temporally_includes_other_session?.should be_true
    @bad_session_contains.session_coincident_with_other_sessions?.should be_true
    


    



  end

  

end
