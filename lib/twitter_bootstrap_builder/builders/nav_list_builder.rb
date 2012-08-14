module TwitterBootstrapBuilder
  module Builders
    class NavListBuilder < Base

      def to_s
        nav_list = NavList.new
        nav_list.append template.capture(self, &block) if block
        nav_list.to_s
      end

      def header(text)
        NavHeader.new(text).to_s.html_safe
      end

      def link_to(*args, &block)
        options = args.select { |a| a.is_a?(Hash) }.first || {}
        if options[:active_if].is_a?(Proc) ? options[:active_if].call : options[:active_if]
          active_link_to(*args, &block)
        else
          Tag.block(:li, template.link_to(*args, &block)).to_s.html_safe
        end
      end

      def active_link_to(*args, &block)
        Tag.block(:li, template.link_to(*args, &block), class: 'active').to_s.html_safe
      end

      def divider
        Tag.block(:li, Divider.vertical).to_s.html_safe
      end

    end
  end
end