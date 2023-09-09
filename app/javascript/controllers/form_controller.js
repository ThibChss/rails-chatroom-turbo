import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  connect() {
  }

  resetForm(event) {
    event.target.reset()
  }
}
