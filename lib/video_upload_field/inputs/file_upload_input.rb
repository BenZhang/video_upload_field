include Rails.application.routes.url_helpers

module VideoUploadField
  module Inputs
    class FileUploadInput < SimpleForm::Inputs::Base
      def input(wrapper_options)
        if options[:direct_upload].present?
          direct_upload_options = merge_wrapper_options({ direct_upload: true }, { data: { target: 'upload-input' } })
        else
          direct_upload_options = { data: { target: 'upload-input' } }
        end

        cover_width = options[:cover_width] || 300
        cover_height = options[:cover_height] || 300
        display_size = "#{cover_width}x#{cover_height}>"

        merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
        merged_input_options = merge_wrapper_options(merged_input_options, direct_upload_options)

        upload_text = options[:upload_text] || "Upload #{reflection_or_attribute_name.to_s.titleize}"

        object_image_url = if options[:display_image_url]
                            options[:display_image_url]
                           else
                             if object.try(reflection_or_attribute_name.to_sym).try(:attached?) && object.try(reflection_or_attribute_name.to_sym).blob.content_type != 'application/pdf'
                               if object.try(reflection_or_attribute_name.to_sym).previewable?
                                 rails_representation_url(object.try(reflection_or_attribute_name.to_sym).preview(resize_to_limit: [cover_width, cover_height]).processed.image.variant(resize: display_size), only_path: true)
                               else
                                 rails_representation_url(object.try(reflection_or_attribute_name.to_sym).variant(resize: display_size), only_path: true)
                               end
                             else
                               ""
                             end
                           end

        "<div class='upload-wrapper #{options[:class]}'>
          <div class='upload-cover-container' style='background-image: url(#{object_image_url});'></div>
          <div class='upload-input-container'>
            <label>
              <div class='upload-text button'>#{upload_text}</div>
              <div class='upload-icon'></div>
              <div class='hide'>#{@builder.file_field(attribute_name, merged_input_options)}</div>
            </label>
          </div>
        </div>".html_safe
      end
    end
  end    
end