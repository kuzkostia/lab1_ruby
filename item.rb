# item.rb
class Item
  attr_accessor :id, :name, :price, :quantity, :category

  def initialize(id, name, price, quantity, category)
    @id = id
    @name = name
    @price = price
    @quantity = quantity
    @category = category
  end

  def info(&block)
    yield("#{name} - #{price}$") if block_given?
  end

  def to_s
    "Item ##{id}: #{name}, Price: #{price}, Quantity: #{quantity}, Category: #{category}"
  end

  def to_h
    { id: id, name: name, price: price, quantity: quantity, category: category }
  end
end