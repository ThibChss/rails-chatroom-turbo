import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static targets = [
    'input'
  ]

  connect() {
    this.inputTarget.focus()
  }

  resetForm(event) {
    event.target.reset()
  }
}
