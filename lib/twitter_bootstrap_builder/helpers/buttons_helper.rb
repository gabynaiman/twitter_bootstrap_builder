module TwitterBootstrapBuilder
  module Helpers
    module ButtonsHelper

      def link_button_to(*args, &block)
        Builders::LinkButtonBuilder.new(self, args: args, &block).html_safe
      end

      TwitterBootstrapMarkup::ButtonBase::TYPES.each do |type|
        define_method "link_button_#{type}_to" do |*args, &block|
          Builders::LinkButtonBuilder.new(self, args: args, type: type, &block).html_safe
        end

        TwitterBootstrapMarkup::ButtonBase::SIZES.each do |size|
          define_method "link_button_#{type}_#{size}_to" do |*args, &block|
            Builders::LinkButtonBuilder.new(self, args: args, type: type, size: size, &block).html_safe
          end
        end
      end

      TwitterBootstrapMarkup::ButtonBase::SIZES.each do |size|
        define_method "link_button_#{size}_to" do |*args, &block|
          Builders::LinkButtonBuilder.new(self, args: args, size: size, &block).html_safe
        end
      end

      def submit_button(*args, &block)
        Builders::SubmitButtonBuilder.new(self, args: args, &block).html_safe
      end

      TwitterBootstrapMarkup::ButtonBase::TYPES.each do |type|
        define_method "submit_button_#{type}" do |*args, &block|
          Builders::SubmitButtonBuilder.new(self, args: args, type: type, &block).html_safe
        end

        TwitterBootstrapMarkup::ButtonBase::SIZES.each do |size|
          define_method "submit_button_#{type}_#{size}" do |*args, &block|
            Builders::SubmitButtonBuilder.new(self, args: args, type: type, size: size, &block).html_safe
          end
        end
      end

      TwitterBootstrapMarkup::ButtonBase::SIZES.each do |size|
        define_method "submit_button_#{size}" do |*args, &block|
          Builders::SubmitButtonBuilder.new(self, args: args, size: size, &block).html_safe
        end
      end

    end
  end
end