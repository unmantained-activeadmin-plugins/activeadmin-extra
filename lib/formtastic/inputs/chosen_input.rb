module Formtastic
  module Inputs

    class ChosenInput < Formtastic::Inputs::SelectInput
      def input_html_options
        new_class = [super[:class], "chosen-input"].compact.join(" ")
        super.merge(:class => new_class,
                    data: {
                      placeholder: options[:placeholder],
                      create_option: options[:create_option]
                    })
      end
    end

  end
end
