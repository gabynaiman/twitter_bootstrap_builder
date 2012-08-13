module TwitterBootstrapBuilder
  module Helpers
    module CommonsHelper

      def page_title(title=nil)
        if title
          content_for(:page_title, title)
        else
          content_for?(:page_title) ? content_for(:page_title) : nil
        end
      end

      def page_header(*args)
        if args.any?
          content_for(:page_header, TwitterBootstrapMarkup::PageHeader.new(args.shift, args.shift).to_s.html_safe)
        else
          content_for?(:page_header) ? content_for(:page_header) : nil
        end
      end

      def alert_message
        unless content_for?(:alert_message)
          if flash[:danger]
            alert_danger(flash[:danger])
          elsif flash[:warning]
            alert_warning(flash[:warning])
          elsif flash[:success]
            alert_success(flash[:success])
          elsif flash[:info]
            alert_info(flash[:info])
          end
        end

        content_for?(:alert_message) ? content_for(:alert_message) : nil
      end

      def nav_bar(&block)
        Builders::NavBarBuilder.new(self, &block).html_safe
      end

      def well(size=nil, &block)
        well = TwitterBootstrapMarkup::Well.new(capture(&block))
        well.send(size) if size
        well.to_s.html_safe
      end

      def well_small(&block)
        well(:small, &block)
      end

      def well_large(&block)
        well(:large, &block)
      end

      def alert_validations(model)
        alert_danger(model.errors.full_messages.join('<br>')) if model.errors.any?
      end

      TwitterBootstrapMarkup::Alert::TYPES.each do |type|
        define_method "alert_#{type}" do |message|
          content_for(:alert_message, TwitterBootstrapMarkup::Alert.new(message).send(type).closable.to_s.html_safe)
        end
      end

      def table_for(collection, model_class=nil, &block)
        Builders::TableBuilder.new(self, collection: collection, model_class: model_class, &block).html_safe
      end

      def fieldset_horizontal_for(model, &block)
        Builders::FieldsetBuilder.new(self, model: model, &block).html_safe
      end

      def dropdown_link(text, &block)
        Builders::DropDownLinkBuilder.new(self, text: text, &block).html_safe
      end

      def icon(name)
        TwitterBootstrapMarkup::Icon.new(name).to_s.html_safe
      end

      def icon_white(name)
        TwitterBootstrapMarkup::Icon.white(name).to_s.html_safe
      end

    end
  end
end