require 'spec_helper'

describe LotjaSelectedReference do
  it "has zero records" do
    LotjaSelectedReference.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:lotja_selected_reference)
    LotjaSelectedReference.count.should == 1
  end
end
