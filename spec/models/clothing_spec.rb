require 'spec_helper'

describe Clothing do 
  it "has a valid factory" do
    FactoryGirl.create(:clothing).should be_valid
  end
  it "is invalid without a name"
  it "is invalid without a type"
  it "is invalid without a user"
end
