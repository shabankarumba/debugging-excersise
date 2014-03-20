require 'spec_helper'
require './post_tagging/post'

describe Post do

  let(:tag) { Tag.new(id: 4, name: "test") }

  subject do
    Post.new(id: 1, title: "Test title", body: "Test body.", tags: [tag])
  end

  it "has an id" do
    subject.id.should eq 1
  end

  it "has a title" do
    subject.title.should eq "Test title"
  end

  it "has a body" do
    subject.body.should eq "Test body."
  end

  it "has a collection of tags" do
    subject.tags.should eq [tag]
  end
end
