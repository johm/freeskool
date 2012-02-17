require 'spec_helper'

describe Location do
  before(:each) do
    @location = Factory(:location)
  end
  
  it "should be valid" do
    @location.should be_valid
  end
end