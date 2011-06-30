require 'spec_helper'

describe PhavuSelectedReference do
  it "has zero records" do
    PhavuSelectedReference.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:phavu_selected_reference)
    PhavuSelectedReference.count.should == 1
  end
end
