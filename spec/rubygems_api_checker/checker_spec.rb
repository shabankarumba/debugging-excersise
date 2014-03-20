require 'spec_helper'
require './rubygems_api_checker/checker'

describe Checker do

  subject { Checker.new("test_gem") }

  describe "#checking" do
    it "returns the gemname from the initializer" do
      subject.checking.should eq "test_gem"
    end
  end

  describe "#available?" do
    let(:empty_response) { double("Response double", body: "[]") }
    let(:full_response) { double("Response double", body: '[{"name":"test_gem"}]') }
    it "makes a call to the rubygems API" do
      HTTParty.should_receive(:get).with("https://rubygems.org/api/v1/search.json?query=test_gem").and_return(empty_response)
      subject.available?
    end
    it "returns true when the response is empty" do
      HTTParty.stub(get: empty_response)
      subject.should be_available
    end

    it "returns false when the response is not empty" do
      HTTParty.stub(get: full_response)
      subject.should_not be_available
    end
  end
end
