require 'spec_helper'

describe TypeClass do
  it "has a valid factory" do
    FactoryGirl.build(:type_class).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:type_class, :name => nil).should_not be_valid
  end
  it "is invalid without a type_id" do
    FactoryGirl.build(:type_class, :type_id => nil).should_not be_valid
  end
  it "is invalid without a symbol" do
    FactoryGirl.build(:type_class, :symbol => nil).should_not be_valid
  end
end
