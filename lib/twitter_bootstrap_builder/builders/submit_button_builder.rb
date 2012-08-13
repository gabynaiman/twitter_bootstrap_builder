module TwitterBootstrapBuilder
  module Builders
    class SubmitButtonBuilder < Base

      def to_s
        submit = block ? Submit.new(*options[:args], &Proc.new {}) : Submit.new(*options[:args])
        submit.send(options[:type]) if options[:type]
        submit.send(options[:size]) if options[:size]
        submit.append template.capture(self, &block) if block
        submit.to_s
      end

    end
  end
end