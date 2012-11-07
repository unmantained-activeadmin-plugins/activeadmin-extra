require 'active_admin/extra/engine'
require 'active_admin/extra/form_builder_extension'

ActiveAdmin::FormBuilder.send :include, ActiveAdmin::Extra::FormBuilderExtension

