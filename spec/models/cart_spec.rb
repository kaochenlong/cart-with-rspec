require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
    # A = Arrange
    cart = Cart.new

    # A = Act
    cart.add(3)

    # A = Assert
    expect(cart.empty?).to be false
  end

  it "加了相同種類的商品，CartItem 不會增加，數量會改變" do
    cart = Cart.new

    3.times { cart.add(1) }
    2.times { cart.add(5) }
    3.times { cart.add(1) }

    expect(cart.items.count).to be 2
    # expect(cart.items.first.quantity).to be 6
  end
end
