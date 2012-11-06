module TwitterBootstrapBuilder
  module Builders
    class NavContainerBuilder < Base

      def to_s
        nav_container = NavContainer.new
        nav_container.pull_right if options[:align] == :right
        nav_container.append template.capture(self, &block) if block
        nav_container.to_s
      end

      def link_to(*args, &block)
        options = args.select { |a| a.is_a?(Hash) }.first || {}
        if options[:active_if].is_a?(Proc) ? options[:active_if].call : options[:active_if]
          active_link_to(*args, &block)
        else
          Tag.block(:li, template.link_to(*args, &block)).html_safe
        end
      end

      def active_link_to(*args, &block)
        Tag.block(:li, template.link_to(*args, &block), class: 'active').html_safe
      end

      def divider
        Tag.block(:li, Divider.vertical).html_safe
      end

      def dropdown_link(text, &block)
        Tag.block(:li, DropDownLinkBuilder.new(template, text: text, &block).html_safe).html_safe
      end

      def custom(&block)
        Tag.block(:li, Tag.block(:a, template.capture(self, &block))).html_safe
      end

    end
  end
end