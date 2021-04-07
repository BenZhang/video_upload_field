require 'simple_form'

module VideoUploadField
  extend ActiveSupport::Autoload
  eager_autoload do
    autoload :Inputs
  end

  def self.eager_load!
    super
    VideoUploadField::Inputs.eager_load!
  end
end