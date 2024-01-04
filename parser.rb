require 'nokogiri'
require 'httparty'

class Parser
  def self.parse_item(html_content, settings)
    doc = Nokogiri::HTML(html_content)
    laptops = []

    doc.css('.product-item').each do |product|
        id = product['data-product-id'].to_i
        name = product.css('.products-list-item__name').text.strip
        price = product.css('.products-list-item__actions-price-current').text.strip.to_i
        quantity = 1  
        category = product.css('.products-list-item__category').text.strip

    item_data = { id: id, name: name, price: price, quantity: quantity, category: category, code: code }

    laptops << item_data

    puts "Parsed item: #{item_data}"
  end

    laptops
  end
end