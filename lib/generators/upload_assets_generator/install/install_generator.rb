module UploadAssetsGenerator
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('upload_assets_templates', __dir__)

      desc "This generator installs the javascript needed for uploads"
      def copy_the_files
        copy_file "javascript/packs/custom_uploader.js", "app/javascript/packs/custom_uploader.js"
        copy_file "javascript/packs/direct_uploads_listener.js", "app/javascript/packs/direct_uploads_listener.js"
        copy_file "javascript/packs/instant_upload_initializer.js", "app/javascript/packs/instant_upload_initializer.js"
        copy_file "assets/stylesheets/components/direct_uploads.sass", "app/assets/stylesheets/components/direct_uploads.sass"
      end
    end
  end
end