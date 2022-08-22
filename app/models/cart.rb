class Cart
  def initialize
    @items = []
  end

  def add(product_id, quantity = 1)
    found_item = @items.find { |item|
      item.product_id == product_id
    }

    if found_item
      found_item.increment(quantity)
    else
      @items << CartItem.new(product_id, quantity)
    end
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end

  def total_price
    total = @items.reduce(0) { |acc, item|
      acc + item.total_price
    }

    if isXmas?
      total = (total * 0.9).floor
    else
      total
    end
  end

  private
  def isXmas?
    Time.now.month == 12 && [24, 25].include?(Time.now.day)
  end
end
