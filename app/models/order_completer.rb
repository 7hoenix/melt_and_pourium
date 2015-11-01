class OrderCompleter
  attr_reader :order, :cart
  def initialize(order, cart)
    @order = order
    @cart = cart
  end

  def process_order
    create_order_items
    order.status = 1
    order.save
  end

  def create_order_items
    cart.data.each do |item_id, quantity|
      price = Item.find(item_id).price
      OrderItem.create(order_id: order.id,
                       quantity: quantity,
                       price:    price,
                       item_id:  item_id)
    end
    empty_cart
  end

  private

  def empty_cart
    @cart = {}
  end
end
