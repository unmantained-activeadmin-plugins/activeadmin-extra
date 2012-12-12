module Formtastic
  module Inputs

    class NumbersSetInput < Formtastic::Inputs::NumberInput
      def to_html
        options[:numbers_set] ||= [:min, :max]
        input_wrapping do
          label_html << options[:numbers_set].map do |n|
            field = "%s_#{n.to_s.parameterize('_')}" % method
            builder.number_field(field, input_html_options) << " #{n.to_s}"
          end.join(" - ").html_safe
        end
      end
    end

  end
end
