module TwitterBootstrapBuilder
  module Builders
    class LinkButtonBuilder < Base

      def to_s
        link_button = block ? LinkButton.new(*options[:args], &Proc.new {}) : LinkButton.new(*options[:args])
        link_button.send(options[:type]) if options[:type]
        link_button.send(options[:size]) if options[:size]
        link_button.append template.capture(self, &block) if block
        link_button.to_s
      end

    end
  end
end