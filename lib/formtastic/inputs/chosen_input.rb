module Formtastic
  module Inputs

    class ChosenInput < Formtastic::Inputs::SelectInput
      def input_html_options
        new_class = [super[:class], "chosen-input"].compact.join(" ")
        data = {create_option: options[:create_option]}
        data[:placeholder] = options[:placeholder] if options[:placeholder]
        super.merge(:class => new_class, data: data)
      end
    end

  end
end
