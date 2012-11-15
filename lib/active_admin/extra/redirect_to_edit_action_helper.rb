module ActiveAdmin
  module Extra

    module RedirectToEditActionHelper
      protected

      def smart_resource_url
        url = nil
        if respond_to? :edit
          url = edit_resource_url rescue nil
        elsif respond_to? :show
          url = resource_url rescue nil
        end
        url || smart_collection_url
      end
    end

  end
end

