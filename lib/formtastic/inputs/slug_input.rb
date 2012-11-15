module Formtastic
  module Inputs

    class SlugInput < Formtastic::Inputs::StringInput

      def input_html_options
        new_class = [super[:class], "slug"].compact.join(" ")
        super.merge(:class => new_class)
      end

      def to_html
        return super unless url_prefix.present?
        input_wrapping do
          label_html <<
          template.content_tag(:div, class: "url-composer") do
            template.content_tag(:span, url_prefix, class: "url-prefix") <<
            builder.text_field(method, input_html_options)
          end
        end
      end

      def url_prefix
        options[:input_html].try(:[], :url_prefix)
      end

    end

  end
end

