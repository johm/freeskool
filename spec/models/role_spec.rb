require 'spec_helper'

describe Role do
  before(:each) do
    @role = Factory(:role)
  end
  
  it "should be valid" do
    @role.should be_valid
  end
end
