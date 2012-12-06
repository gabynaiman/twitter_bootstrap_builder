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
          content_for(:page_header, TwitterBootstrapMarkup::PageHeader.new(args.shift, args.shift).html_safe)
        else
          content_for?(:page_header) ? content_for(:page_header) : nil
        end
      end

      def side_bar(partial=nil, &block)
        if partial
          content_for(:side_bar) { render "layouts/#{partial}" }
        elsif block
          content_for(:side_bar, &block)
        else
          content_for?(:side_bar) ? content_for(:side_bar) : nil
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

      def nav_list(&block)
        Builders::NavListBuilder.new(self, &block).html_safe
      end

      def tab(&block)
        Builders::TabBuilder.new(self, &block).html_safe
      end

      def well(size=nil, &block)
        well = TwitterBootstrapMarkup::Well.new(capture(&block))
        well.send(size) if size
        well.html_safe
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
          content_for(:alert_message, TwitterBootstrapMarkup::Alert.new(message).send(type).closable.html_safe)
        end
      end

      def table_for(collection, model_class=nil, &block)
        Builders::TableBuilder.new(self, collection: collection, model_class: model_class, &block).html_safe
      end

      def fieldset_horizontal_for(model, &block)
        Builders::FieldsetBuilder.new(self, model: model, &block).html_safe
      end

      def fieldset_horizontal(&block)
        Builders::FieldsetBuilder.new(self, &block).html_safe
      end

      def icon(*args)
        TwitterBootstrapMarkup::Icon.new(*args).html_safe
      end

      def icon_white(*args)
        TwitterBootstrapMarkup::Icon.white(*args).html_safe
      end

      TwitterBootstrapMarkup::LabelBase::TYPES.each do |type|
        define_method "label_#{type}" do |*args|
          TwitterBootstrapMarkup::Label.send(type, *args).html_safe
        end

        define_method "badge_#{type}" do |*args|
          TwitterBootstrapMarkup::Badge.send(type, *args).html_safe
        end
      end

      def label(*args)
        TwitterBootstrapMarkup::Label.new(*args).html_safe
      end

      def badge(*args)
        TwitterBootstrapMarkup::Badge.new(*args).html_safe
      end

    end
  end
end