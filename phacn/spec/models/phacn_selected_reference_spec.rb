require 'spec_helper'

describe PhacnSelectedReference do
  it "has zero records" do
    PhacnSelectedReference.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:phacn_selected_reference)
    PhacnSelectedReference.count.should == 1
  end
end
