  
module VideoUploadField
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "This generator installs the javascript needed for cocoon"
      def copy_the_files
        copy_file "../../../../../app/inputs/direct_upload_input.rb", "app/inputs/direct_upload_input.rb"
        copy_file "../../../../../app/javascript/controllers/direct_uploader_controller.js", "app/javascript/controllers/direct_uploader_controller.js"
        copy_file "../../../../../app/javascript/packs/custom_uploader.js", "app/javascript/packs/custom_uploader.js"
        copy_file "../../../../../app/javascript/packs/direct_uploads.js", "app/javascript/packs/direct_uploads.js"
        copy_file "../../../../../app/assets/stylesheets/components/direct_uploads.sass", "app/assets/stylesheets/components/direct_uploads.sass"
      end
    end
  end
end