require 'spec_helper'

describe PeaSelectedReference do
  it "has zero records" do
    PeaSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:pea_selected_reference)
    PeaSelectedReference.count.should == 1
  end
end
