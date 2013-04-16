module Formtastic
  module Inputs
    class TermsInput < Formtastic::Inputs::StringInput
      def input_html_options
        new_class = [super[:class], "terms-input"].compact.join(" ")
        super.merge(:class => new_class, data: { terms: options[:terms] })
      end
    end
  end
end

