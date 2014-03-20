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
    @items.each do |item|
      @total = @total + item.price
    end
    @total
  end
end
