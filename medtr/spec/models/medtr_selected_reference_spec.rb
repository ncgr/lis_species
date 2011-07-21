require 'spec_helper'

describe MedtrSelectedReference do
  it "has zero records" do
    MedtrSelectedReference.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:medtr_selected_reference)
    MedtrSelectedReference.count.should == 1
  end
end
