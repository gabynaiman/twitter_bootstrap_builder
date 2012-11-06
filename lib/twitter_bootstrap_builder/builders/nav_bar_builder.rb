module TwitterBootstrapBuilder
  module Builders
    class NavBarBuilder < Base

      def to_s
        nav_bar = NavBar.top
        nav_bar.append template.capture(self, &block) if block
        nav_bar.to_s
      end

      def brand(title, url)
        Brand.new(title, url).html_safe
      end

      def container(&block)
        NavContainerBuilder.new(template, &block).html_safe
      end

      def container_right(&block)
        NavContainerBuilder.new(template, align: :right, &block).html_safe
      end

    end
  end
end