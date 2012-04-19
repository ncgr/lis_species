require 'spec_helper'

describe LencuSelectedReference do
  it "has zero records" do
    LencuSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:lencu_selected_reference)
    LencuSelectedReference.count.should == 1
  end
end
