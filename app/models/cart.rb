# frozen_string_literal: true

class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(product_id)
    found_item = items.find { |item| item.product_id == product_id }

    if found_item
      found_item.increment
    else
      @items << CartItem.new(product_id)
    end
  end

  def remove_item(product_id)
    found_item = items.find { |item| item.product_id == product_id }
    @items -= [found_item]
  end

  def empty?
    items.empty?
  end

  def total_price
    items.reduce(0) { |sum, item| sum + item.price }
  end

  def serialize
    all_items = items.map do |item|
      { product_id: item.product_id, quantity: item.quantity }
    end

    if { items: all_items } == { items: [] }
      nil
    else
      { items: all_items }
    end
  end

  def self.from_hash(hash)
    if hash.nil?
      new []
    else
      new hash['items'].map { |item_hash|
        CartItem.new(item_hash['product_id'], item_hash['quantity'])
      }
    end
  end
end
