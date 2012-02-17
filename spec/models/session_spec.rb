require 'spec_helper'

describe Session do
  before(:each) do
    @session = Factory(:session)
  end
  
  it "should be valid" do
    @session.should be_valid
  end
end