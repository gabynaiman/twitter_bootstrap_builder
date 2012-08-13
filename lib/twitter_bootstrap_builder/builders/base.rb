module TwitterBootstrapBuilder
  module Builders
    class Base
      include TwitterBootstrapMarkup

      attr_reader :template, :options, :block

      def initialize(template, options={}, &block)
        @template = template
        @options = options
        @block = block
      end

      def html_safe
        to_s.html_safe
      end

    end
  end
end