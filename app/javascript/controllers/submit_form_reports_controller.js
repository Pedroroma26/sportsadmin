import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-form-reports"
export default class extends Controller {

  static targets = ["instanceForm", "reportForm", "report"]

  submitForms(event) {
    event.preventDefault()

    const instanceFormUrl = this.instanceFormTarget.action

    fetch(instanceFormUrl, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.instanceFormTarget)
    })
      .then(response => response.json())
      .then(() => {
        this.#submitReport()
      })
  }

  #submitReport() {
    const reportUrl = this.reportFormTarget.action
    fetch(reportUrl, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.reportFormTarget)
    })
      .then(response => response.text())
      .then(data => {
        this.element.innerHTML = data
        this.reportFormTarget.classList.add("d-none")
        this.instanceFormTarget.classList.add("d-none")
      })
  }
}
