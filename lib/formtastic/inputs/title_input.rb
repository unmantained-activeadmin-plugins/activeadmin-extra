module Formtastic
  module Inputs

    class TitleInput < Formtastic::Inputs::StringInput
      def input_html_options
        new_class = [super[:class], "title"].compact.join(" ")
        super.merge(:class => new_class)
      end
    end

  end
end
