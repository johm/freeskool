require 'spec_helper'

describe Course do
  before(:each) do
    @course = Factory(:course)
  end
  
  it "should be valid" do
    @course.should be_valid
  end
end