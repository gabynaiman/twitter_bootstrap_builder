module TwitterBootstrapBuilder
  module Builders
  	module FormBuilder
  
  	  def fieldset_horizontal(&block)
  	  	Builders::FieldsetBuilder.new(@template, form_builder: self, &block).html_safe
  	  end
  
  	end
  end
end