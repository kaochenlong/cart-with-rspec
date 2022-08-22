class Cart
  def initialize
    @items = []
  end

  def add(product_id)
    @items << product_id
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end
end
