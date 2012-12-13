module ActiveAdmin
  module Extra
    module FormBuilderExtension
      extend ActiveSupport::Concern

      def destroy(options = {})
        unless object.new_record?
          input :_destroy, { :as => :boolean }.reverse_merge(options)
        end
        form_buffers.last
      end

      module ClassMethods
      end
    end
  end
end
