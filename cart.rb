require_relative 'item'
require_relative 'item_container'

class Cart
  include ItemContainer

  def initialize(main_application)
    @items = []
    @main_application = main_application
  end

  def save_to_file(file_path)
    full_path = File.join(@main_application.data_path, file_path)
    File.open(full_path, 'w') { |file| file.puts @items.map(&:to_s) }
  end

  def save_to_json(file_path)
    full_path = File.join(@main_application.data_path, file_path)
    File.open(full_path, 'w') { |file| file.write(JSON.pretty_generate(@items.map(&:to_h))) }
  end

  def save_to_csv(file_path)
    full_path = File.join(@main_application.data_path, file_path)
    CSV.open(full_path, 'w') do |csv|
      csv << Item.new(1, '', '', '', '').to_h.keys
      @items.each { |item| csv << item.to_h.values }
    end
  end
end