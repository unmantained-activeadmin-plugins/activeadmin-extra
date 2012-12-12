module Formtastic
  module Inputs

    class BoundsInput < Formtastic::Inputs::NumberInput
      def to_html
        options[:bounds] = (options[:bounds] || {}).reverse_merge({:labels => {}, :fields => {}})
        bounds_labels = options[:bounds][:labels].reverse_merge({:min => "min", :max => "max"})
        bounds_fields = options[:bounds][:fields].reverse_merge({:min => "%s_" << bounds_labels[:min].parameterize("_"), :max => "%s_" << bounds_labels[:max].parameterize("_")})
        bounds_fields.each {|k,v| bounds_fields[k] = v.to_s % method}
        input_wrapping do
          label_html <<
            builder.number_field(bounds_fields[:min], input_html_options) <<
            " #{bounds_labels[:min]}" <<
            " - " <<
            builder.number_field(bounds_fields[:max], input_html_options) <<
            " #{bounds_labels[:max]}"
        end
      end
    end

  end
end
