require 'spec_helper'
require './basket/item'

describe Item do

  subject { Item.new(4.55) }

  it "sets the price in initialize" do
    subject.price.should eq 4.55
  end

end
