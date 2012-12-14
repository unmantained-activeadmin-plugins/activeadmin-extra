module Formtastic
  module Inputs

    class MeasureInput < Formtastic::Inputs::NumberInput
      def to_html
        input_wrapping do
          label_html <<
            template.content_tag(:span) do
              builder.number_field(method, input_html_options) << " #{options[:symbol]}"
            end
        end
      end
    end

  end
end
