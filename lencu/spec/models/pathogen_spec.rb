require 'spec_helper'

describe Pathogen do
  it "has zero records" do
    Pathogen.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:pathogen)
    Pathogen.count.should == 1
  end
end
