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
    expect(cart.items.first.quantity).to be 6
  end

  it "商品可以放到購物車裡，也可以再拿出來" do
    p1 = create(:product, price: 10)
    cart = Cart.new

    cart.add(p1.id)

    expect(cart.items.first.product).to be_a Product
    expect(cart.items.first.product.price).to be 10
  end

  it "每個 Cart Item 都可以計算它自己的金額（小計）" do
    p1 = create(:product, price: 10)
    cart = Cart.new

    3.times { cart.add(p1.id) }

    expect(cart.items.first.total_price).to be 30
  end

  it "可以計算整台購物車的總消費金額" do
    p1 = create(:product, price: 10)
    p2 = create(:product, price: 20)
    cart = Cart.new

    3.times { cart.add(p1.id) }
    5.times { cart.add(p2.id) }

    expect(cart.total_price).to be 130
  end

  it "特別活動聖誕節的時候全面打 9 折" do
    p1 = create(:product, price: 10)
    p2 = create(:product, price: 20)
    cart = Cart.new

    3.times { cart.add(p1.id) }
    5.times { cart.add(p2.id) }

    t = Time.local(Time.now.year, 12, 24, 10, 0, 0)
    Timecop.travel(t)

    expect(cart.total_price).to be 117
  end
end
