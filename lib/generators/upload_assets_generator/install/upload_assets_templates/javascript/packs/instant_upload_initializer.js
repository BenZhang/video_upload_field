// Only for direct upload
import { CustomUploader } from 'packs/custom_uploader'

export const InstantUploadInitializer = {
  init: function(selector_str){
    const inputs = document.querySelectorAll(selector_str)
    // Bind to file drop - use the ondrop on a parent element or use a
    // library like Dropzone
    const onDrop = (event) => {
      event.preventDefault();
      const files = event.dataTransfer.files;
      Array.from(files).forEach(file => file_sender(file))
    }

    inputs.forEach(
      function(input) {
        input.addEventListener('change', (event) => {
          Array.from(input.files).forEach(file => uploadFile(file, input))
          // you might clear the selected files from the input
          input.value = null
        })
      }
    );

    const uploadFile = (file, input) => {
      // your form needs the file_field direct_upload: true, which
      // provides data-direct-upload-url
      const upload = new CustomUploader(input, file)
      upload.start();
    }
  }
}