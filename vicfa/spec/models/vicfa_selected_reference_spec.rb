require 'spec_helper'

describe VicfaSelectedReference do
  it "has zero records" do
    VicfaSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:vicfa_selected_reference)
    VicfaSelectedReference.count.should == 1
  end
end
