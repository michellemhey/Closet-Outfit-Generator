require 'spec_helper'

describe Type do
  it "has a valid factory" do
    FactoryGirl.create(:type).should be_valid
  end
  it "is invalid without a type" do
    FactoryGirl.build(:type, name: nil).should_not be_valid
  end
end
