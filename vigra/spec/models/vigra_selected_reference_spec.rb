require 'spec_helper'

describe VigraSelectedReference do
  it "has zero records" do
    VigraSelectedReference.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:vigra_selected_reference)
    VigraSelectedReference.count.should == 1
  end
end
