require 'spec_helper'

describe LupanContentsHelper do
  describe "#format_species_name" do
    it "returns HTML safe name wrapped in <em>" do
      helper.format_species_name("foo bar (baz)").should eq(
       "<em>foo bar </em>(baz)"
      )
    end
  end
end
