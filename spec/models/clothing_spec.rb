require 'spec_helper'

describe Clothing do 
  it "has a valid factory" do
    FactoryGirl.build(:clothing).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:clothing, :name => nil).should_not be_valid
  end
  it "is invalid without a type" do
    FactoryGirl.build(:clothing, :type_id => nil).should_not be_valid
  end
  it "is invalid without a user" do
    FactoryGirl.build(:clothing, :user_id => nil).should_not be_valid
  end
end
