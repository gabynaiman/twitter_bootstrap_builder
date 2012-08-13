module TwitterBootstrapBuilder
  module Builders
    class DropDownLinkBuilder < Base

      def to_s
        dropdown_link = DropdownLink.new(options[:text])
        dropdown_link.append template.capture(self, &block) if block
        dropdown_link.as_nav_item.to_s
      end

      def link_to(*args, &block)
        Tag.block(:li, template.link_to(*args, &block)).to_s.html_safe
      end

    end
  end
end