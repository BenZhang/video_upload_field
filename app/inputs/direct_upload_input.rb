class DirectUploadInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    direct_upload_options = { direct_upload: true, label: false }
    if options[:direct_upload].present?
      direct_upload_options = merge_wrapper_options(direct_upload_options, { data: { action: 'change->direct-uploader#direct_upload' } })
    end

    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    merged_input_options = merge_wrapper_options(merged_input_options, direct_upload_options)

    "<div class='upload-wrapper'>
      <div class='upload-container' data-controller='direct-uploader'>
        <label>
          <div class='upload-text'>Upload Image</div>
          <div class='upload-icon'></div>
          <div class='hide'>#{@builder.file_field(attribute_name, merged_input_options)}</div>
        </label>
      </div>
    </div>".html_safe
  end
end