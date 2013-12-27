# requires the following in config/initializers/active_admin.rb
# ActiveAdmin.application.register_javascript "https://maps.googleapis.com/maps/api/js?sensor=false"

module Formtastic
  module Inputs
    class MapAddressInput < Formtastic::Inputs::StringInput
      def to_html
        center = options[:center_at] || [ 43.77, 11.24 ]
        zoom = options[:zoom_level] || 8
        alert_on_error = options[:alert_on_error] || false
        input_wrapping do
          label_html <<
          template.content_tag(:div, class: "map-address-input", data: { center: center, zoom: zoom, alert_on_error: alert_on_error }) do
            template.content_tag(:div, class: "map") do
            end <<
            builder.text_field(method, input_html_options.merge(role: 'address')) <<
            builder.text_field(options[:latitude] || :latitude, role: 'latitude') <<
            builder.text_field(options[:longitude] || :longitude, role: 'longitude')
          end
        end
      end
    end
  end
end
