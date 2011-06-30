require 'spec_helper'

describe LupalSelectedReference do
  it "has zero records" do
    LupalSelectedReference.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:lupal_selected_reference)
    LupalSelectedReference.count.should == 1
  end
end
