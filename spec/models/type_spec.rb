require 'spec_helper'

describe Type do
  it "has a valid factory" do
    FactoryGirl.build(:type).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:type, :name => nil).should_not be_valid
  end
  it "is invalid without a type_class_id" do
    FactoryGirl.build(:type, :type_class_id => nil).should_not be_valid
  end
end
