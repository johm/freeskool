require 'spec_helper'

describe Signup do
  before(:each) do 
    @signup = Factory(:signup)
  end
  
  it "should be valid" do
    @signup.should be_valid
  end
end