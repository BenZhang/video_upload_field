include Rails.application.routes.url_helpers

module VideoUploadField
  module Inputs
    class FileUploadInput < SimpleForm::Inputs::Base
      def input(wrapper_options)
        if options[:direct_upload].present?
          direct_upload_options = merge_wrapper_options({ direct_upload: true }, { data: { action: 'change->direct-uploader#direct_upload' } })
        else
          direct_upload_options = {}
        end

        merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
        merged_input_options = merge_wrapper_options(merged_input_options, direct_upload_options)

        upload_text = options[:upload_text] || "Upload #{reflection_or_attribute_name.to_s.titleize}"

        object_image_url = if options[:display_image_url]
                            options[:display_image_url]
                           else
                            "#{object.try(reflection_or_attribute_name.to_sym).try(:attached?) ? rails_representation_url(object.try(reflection_or_attribute_name.to_sym).variant(resize: '500x300>'), only_path: true) : ''}"
                           end

        "<div class='upload-wrapper'>
          <div class='uploaded-container' style='background-image: url(#{object_image_url})'></div>
          <div class='upload-container' data-controller='direct-uploader'>
            <label>
              <div class='upload-text'>#{upload_text}</div>
              <div class='upload-icon'></div>
              <div class='hide'>#{@builder.file_field(attribute_name, merged_input_options)}</div>
            </label>
          </div>
        </div>".html_safe
      end
    end
  end    
end