module TwitterBootstrapBuilder
  module Helpers
    module DropdownsHelper

      def dropdown_link(text, &block)
        Builders::DropDownLinkBuilder.new(self, text: text, &block).html_safe
      end

      def dropdown_button(text, &block)
        Builders::DropDownButtonBuilder.new(self, text: text, &block).html_safe
      end

      TwitterBootstrapMarkup::ButtonBase::TYPES.each do |type|
        define_method "dropdown_button_#{type}" do |text, &block|
          Builders::DropDownButtonBuilder.new(self, text: text, type: type, &block).html_safe
        end

        TwitterBootstrapMarkup::ButtonBase::SIZES.each do |size|
          define_method "dropdown_button_#{type}_#{size}" do |text, &block|
            Builders::DropDownButtonBuilder.new(self, text: text, type: type, size: size, &block).html_safe
          end
        end
      end

      TwitterBootstrapMarkup::ButtonBase::SIZES.each do |size|
        define_method "dropdown_button_#{size}" do |text, &block|
          Builders::DropDownButtonBuilder.new(self, text: text, size: size, &block).html_safe
        end
      end

    end
  end
end