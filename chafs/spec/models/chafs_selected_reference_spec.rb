require 'spec_helper'

describe ChafsSelectedReference do
  it "has zero records" do
    ChafsSelectedReference.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:chafs_selected_reference)
    ChafsSelectedReference.count.should == 1
  end
end
