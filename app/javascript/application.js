// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()


document.addEventListener("direct-upload:initialize", (event) => {
    const progressContainer = document.getElementById("upload-progress")
    const progressBar = document.getElementById("upload-progress-bar")
    progressBar.style.width = "0%"
    progressBar.innerText = "0%"
    progressContainer.classList.remove("d-none")
})
  
document.addEventListener("direct-upload:progress", (event) => {
    const progressBar = document.getElementById("upload-progress-bar")
    const progress = Math.round(event.detail.progress)
    progressBar.style.width = `${progress}%`
    progressBar.innerText = `${progress}%`
})
  
document.addEventListener("direct-upload:end", () => {
    const progressBar = document.getElementById("upload-progress-bar")
    progressBar.innerText = "Upload complete"
})