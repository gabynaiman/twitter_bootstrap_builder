module TwitterBootstrapBuilder
  module Builders
    class DropDownBuilder < Base

      def to_s
        dropdown = self.dropdown_class.new(options[:text])
        dropdown.append template.capture(self, &block) if block
        dropdown.send(options[:type]) if options[:type] && dropdown.respond_to?(options[:type])
        dropdown.send(options[:size]) if options[:size] && dropdown.respond_to?(options[:size])
        dropdown.as_nav_item if dropdown.respond_to? :as_nav_item
        dropdown.to_s
      end

      def link_to(*args, &block)
        Tag.block(:li, template.link_to(*args, &block)).html_safe
      end

    end
  end
end