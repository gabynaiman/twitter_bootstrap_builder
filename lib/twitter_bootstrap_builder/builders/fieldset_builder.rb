module TwitterBootstrapBuilder
  module Builders
    class FieldsetBuilder < Base

      def to_s
        fieldset = Tag.block(:fieldset, class: 'form-horizontal')
        fieldset.append template.capture(self, &block) if block
        fieldset.to_s
      end

      def form_builder
        options[:form_builder]
      end

      def model
        options[:model] || form_builder.object
      end

      def actions(&block)
        actions = Tag.block(:div, class: 'form-actions')
        actions.append template.capture(self, &block) if block
        actions.to_s.html_safe
      end

      def display_field(method)
        ControlGroup.new(model.class.human_attribute_name(method)) do |cg|
          cg.append Tag.block(:span, model.send(method), class: 'display')
        end.to_s.html_safe
      end

      def text_field(method, options={})
        ControlGroup.new(model.class.human_attribute_name(method), for: "#{form_builder.object_name}_#{method}") do |cg|
          cg.append form_builder.text_field(method, options)
        end.to_s.html_safe
      end

      def select(method, choices, options={}, html_options={})
        ControlGroup.new(model.class.human_attribute_name(method), for: "#{form_builder.object_name}_#{method}") do |cg|
          cg.append form_builder.select(method, choices, options, html_options)
        end.to_s.html_safe
      end

      def custom_field(label, &block)
        ControlGroup.new(label) do |cg|
          cg.append template.capture(self, &block) if block
        end.to_s.html_safe
      end

    end
  end
end