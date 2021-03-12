export const direct_upload = {
  init: function() {
    addEventListener("direct-upload:initialize", event => {
      console.log('test2')
      const { target, detail } = event
      const { id, file } = detail
      console.log(target.parentNode)
      target.parentNode.insertAdjacentHTML("beforebegin", `
        <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
          <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
          <span class="direct-upload__filename"></span>
        </div>
      `)
      target.parentNode.previousElementSibling.querySelector(`.direct-upload__filename`).textContent = file.name
    })
    
    addEventListener("direct-upload:start", event => {
      console.log('test2')
    
      const { id } = event.detail
      const element = document.getElementById(`direct-upload-${id}`)
      element.classList.remove("direct-upload--pending")
    })
    
    addEventListener("direct-upload:progress", event => {
      console.log('test2')
    
      const { id, progress } = event.detail
      const progressElement = document.getElementById(`direct-upload-progress-${id}`)
      progressElement.style.width = `${progress}%`
    })
    
    addEventListener("direct-upload:error", event => {
      event.preventDefault()
      const { id, error } = event.detail
      const element = document.getElementById(`direct-upload-${id}`)
      element.classList.add("direct-upload--error")
      element.setAttribute("title", error)
    })
    
    addEventListener("direct-upload:end", event => {
      const { id } = event.detail
      const element = document.getElementById(`direct-upload-${id}`)
      element.classList.add("direct-upload--complete")
    })
  }
}