import { Controller } from "stimulus"
import { CustomUploader } from "packs/custom_uploader"

export default class extends Controller {
  static targets =  []

  connect(){
    console.log('tewtw');
  }

  direct_upload(e){
    const uploadFile = (file, input) => {
      // your form needs the file_field direct_upload: true, which
      // provides data-direct-upload-url
      const upload = new CustomUploader(input, file)
      upload.start();
    }

    Array.from(e.target.files).forEach(file => uploadFile(file, e.target))
    // you might clear the selected files from the input
    e.target.value = null
  }
}