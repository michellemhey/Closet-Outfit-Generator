require 'spec_helper'

describe TypeClass do
  it "has a valid factory" do
    FactoryGirl.create(:type_class_id).should be_valid
  end
end
