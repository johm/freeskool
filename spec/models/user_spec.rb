require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:user)
  end
  
  it "should be valid" do
    @user.should be_valid
  end
  
end