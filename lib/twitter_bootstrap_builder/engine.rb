module TwitterBootstrapBuilder
  class Engine < ::Rails::Engine
    initializer 'twitter_bootstrap_builder' do |app|
      ActiveSupport.on_load(:action_view) do
        class ActionView::Base
          include TwitterBootstrapBuilder::Helpers::CommonsHelper
          include TwitterBootstrapBuilder::Helpers::ButtonsHelper
        end

        class ActionView::Helpers::FormBuilder
          include TwitterBootstrapBuilder::Builders::FormBuilder
        end 
      end
    end
  end
end