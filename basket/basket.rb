require './basket/item'

class Basket

  def initialize
    @items = []
    @total = 0
  end

  def items
    @items
  end

  def add_item(item)
    @items << item
  end

  def total
    sum = 0
    @items.each do |item|
      sum += item.price
    end
    @total = sum
  end
end
