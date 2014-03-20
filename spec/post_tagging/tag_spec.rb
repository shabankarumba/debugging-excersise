require 'spec_helper'
require './post_tagging/tag'

describe Tag do

  subject { Tag.new(id: 5, name: "Test tag") }

  it "has an id" do
    subject.id.should eq 5
  end

  it "has a name" do
    subject.name.should eq "Test tag"
  end
  
end
