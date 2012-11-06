module TwitterBootstrapBuilder
  module Builders
    class TableBuilder < Base

      def initialize(*args, &block)
        super
        @fields = {}
      end

      def to_s
        template.capture(self, &block) if block

        Tag.block(:div, class: 'table-container') do |data|
          data.append do |d|
            Tag.block(:table, class: 'table table-striped table-condensed') do |table|
              table.append thead
              table.append tbody
            end
          end
          data.append pager
        end.html_safe
      end

      def collection
        options[:collection]
      end

      def model_class
        options[:model_class] || collection.klass
      end

      def field(method, &block)
        @fields[method] = block
        nil
      end

      def actions(&block)
        @actions_block = block
        nil
      end

      private

      def thead
        Tag.block(:thead) do |thead|
          thead.append do |h|
            Tag.block(:tr) do |tr|
              tr.append Tag.block(:th)
              @fields.keys.each do |field|
                tr.append Tag.block(:th, model_class.human_attribute_name(field))
              end
            end
          end
        end
      end

      def tbody
        Tag.block(:tbody) do |tbody|
          collection.each do |model|
            tbody.append do |b|
              Tag.block(:tr) do |tr|
                tr.append Tag.block(:td, template.capture(model, &@actions_block), class: 'actions') if @actions_block
                @fields.each do |field, block|
                  tr.append Tag.block(:td, (block ? template.capture(model, &block) : model.send(field)))
                end
              end
            end
          end
        end
      end

      def pager
        Tag.new(:div, template.paginate(collection, theme: :twitter_bootstrap)).pull_right if collection.respond_to?(:current_page)
      end

    end
  end
end