module ItemContainer
  module ClassMethods
    def class_method_example
      
    end
  end

  module InstanceMethods
    def add_item(item)
      @items << item
    end

    def remove_item(item)
      @items.delete(item)
    end

    def delete_items
      @items = []
    end

    def method_missing(method_name, *args)
      if method_name.to_s.start_with?('show_all_items')
        show_all_items(method_name.to_s.split('_').last.to_sym, *args)
      else
        super
      end
    end

    private

    def show_all_items(format, &block)
      @items.each { |item| puts item.send(format, &block) }
    end
  end

  def self.included(class_instance)
    class_instance.extend(ClassMethods)
    class_instance.include(InstanceMethods)
  end
end