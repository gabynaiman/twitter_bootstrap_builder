module TwitterBootstrapBuilder
  module Builders
    class TabBuilder < Base

      def initialize(*args, &block)
        super
        @tab = Tab.new
      end

      def to_s
        template.capture(self, &block) if block
        @tab.to_s
      end

      def content_for(text, id=nil, &block)
        id = text.parameterize('_') unless id
        @tab.nav.append NavTab.new(text, "##{id}")
        @tab.content.append id, template.capture(self, &block) if block_given?
      end

    end
  end
end