module ActiveAdmin
  module Extra
    module FormBuilderExtension
      extend ActiveSupport::Concern

      included do |base|
        base.class_eval do
          alias_method_chain :has_many, :fixes
        end
      end

      def has_many_with_fixes(association, options = {}, &block)
        options = { :for => association }.merge(options)

        # Add Delete Links
        form_block = proc do |has_many_form|
          # @see https://github.com/justinfrench/formtastic/blob/2.2.1/lib/formtastic/helpers/inputs_helper.rb#L373
          contents = if block.arity == 1  # for backwards compatibility with REE & Ruby 1.8.x
            block.call(has_many_form)
          else
            index = parent_child_index(options[:parent]) if options[:parent]
            block.call(has_many_form, index)
          end

          if has_many_form.object.new_record?
            contents += template.content_tag(:li, class: "has_many_delete") do
              template.link_to I18n.t('active_admin.has_many_delete'), "#", :onclick => "$(this).closest('.has_many_fields').remove(); return false;", :class => "button"
            end
          end

          contents
        end

        content = with_new_form_buffer do
          template.content_tag :div, :class => "has_many #{association} #{options[:class]}" do
            form_buffers.last << template.content_tag(:h3, options[:label] || object.class.reflect_on_association(association).klass.model_name.human(:count => 1.1))

            options[:class] ||= ""
            options[:class] = "#{options[:class]} inputs has_many_fields".strip
            inputs options, &form_block

            # Capture the ADD JS
            js = with_new_form_buffer do
              inputs_for_nested_attributes  :for => [association, object.class.reflect_on_association(association).klass.new],
                                            :class => options[:class],
                                            :for_options => {
                                              :child_index => "NEW_RECORD"
                                            }, &form_block
            end

            js = template.escape_javascript(js)
            js = template.link_to I18n.t('active_admin.has_many_new', :model => object.class.reflect_on_association(association).klass.model_name.human), "#", :onclick => "$(this).before('#{js}'.replace(/NEW_RECORD/g, new Date().getTime())); return false;", :class => "button"

            form_buffers.last << js.html_safe
          end
        end
        form_buffers.last << content.html_safe
      end

      def destroy(options = {})
        unless object.new_record?
          input :_destroy, { :as => :boolean }.reverse_merge(options)
        end
        form_buffers.last
      end

      def errors
        inputs I18n.t('active_admin.errors'), class: "flash flash_error" do
          object.errors.full_messages.map { |e| "<li>#{e}</li>"}.join.html_safe
        end if object.errors.any?
      end

      module ClassMethods
      end
    end
  end
end
