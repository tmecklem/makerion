
class FileUploadHandler {
  constructor(formElement) {
    this.formElement = formElement
    this.formElement.onsubmit = this.uploadFile

    this.fileInput = formElement.querySelector('[type=file]')
    this.fileInput.onchange = this.fileChanged
  }

  fileChanged = (e) => {
    console.log("here fileChanged")
  }

  uploadFile = (e) => {
    e.preventDefault()
    e.cancelBubble = true
    console.log("here uploadFile")

    const data = new FormData(this.formElement)
    this.postData(data)

    return false
  }

  postData = (data = {}) => {
    return window
      .fetch(`/api/print_files`, {
        method: "POST",
        // mode: "cors", // no-cors, cors, *same-origin
        cache: "no-cache",
        // credentials: "same-origin",
        headers: {
          // "Content-Type": "multipart/form-data"
          // "X-CSRF-Token": document.querySelector("meta[name=\"csrf-token\"]").getAttribute("content")
          "Accept": "application/json"
        },
        referrer: "no-referrer", // no-referrer, *client
        body: data
      })
      .then(response => response.json())
      .catch(error => console.error('Error:', error))
      // .then((data) => {
      //   console.loag('Success')
      //   // return new Promise((resolve) => {
      //     // resolve(humps.camelizeKeys(data))
      //   // })
      // })
  }
}

window.addEventListener('DOMContentLoaded', (event) => {
  Array
    .from(document.querySelectorAll('.file-upload-form'))
    .map(element => new FileUploadHandler(element))
});
