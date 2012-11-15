require 'active_admin'

module ActiveAdmin
  module Extra

    class Engine < ::Rails::Engine
      engine_name "activeadmin_extra"

      initializer "redirect to edit action" do
        require 'active_admin/extra/redirect_to_edit_action_helper'
        ActiveAdmin::ResourceController.send :include, ActiveAdmin::Extra::RedirectToEditActionHelper
      end
    end

  end
end
