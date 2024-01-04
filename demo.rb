require_relative 'main_application'
require_relative 'item'
require_relative 'cart'
require_relative 'parser'

user_data = 'user123'
data_path = File.join(Dir.home, 'Desktop', 'MyCartFiles')
app = MainApplication.new(user_data, data_path)

url = 'https://comfy.ua/ua/notebook/brand__asus/'
html_content = HTTParty.get(url).body


settings = { condition: 'some_condition' }
items_data = Parser.parse_item(html_content, settings)

# Create Cart object, add items, and save to different formats
cart = Cart.new(app)

items_data.each do |item_data|
  item = Item.new(item_data[:id], item_data[:name], item_data[:price], item_data[:quantity], item_data[:category])
  cart.add_item(item)
end

cart.save_to_file('cart_data.txt')
cart.save_to_json('cart_data.json')
cart.save_to_csv('cart_data.csv')