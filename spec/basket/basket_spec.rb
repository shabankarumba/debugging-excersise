require 'spec_helper'
require './basket/basket'

describe Basket do

  let(:hat) { Item.new(4.55) }
  let(:tshirt) { Item.new(9.0) }

  describe "#items" do
    it "starts as an empty array" do
      subject.items.should be_empty
    end
  end

  describe "#add_item" do
    it "adds an item to the basket" do
      subject.add_item(hat)
      subject.items.should eq [hat]
    end

    it "does not overwrite other items in the basket" do
      subject.add_item(hat)
      subject.add_item(tshirt)
      subject.items.should eq [hat, tshirt]
    end
  end

  describe '#total' do
    it "returns 0 if there are no items in the basket" do
      subject.total.should eq 0
    end
    it "returns the price of a single item" do
      subject.add_item(hat)
      subject.total.should eq hat.price
    end
    it "returns the sum of prices for multiple items" do
      subject.add_item(hat)
      subject.add_item(tshirt)
      subject.total.should eq(hat.price + tshirt.price)
    end

    it "returns the correct price if you check the total, add another thing, and check the total again" do
      subject.add_item(hat)
      subject.total
      subject.add_item(tshirt)
      subject.total.should eq(hat.price + tshirt.price)
    end
  end
end
