import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["nav"]

  toggle(event) {
    event.stopPropagation()
    this.navTarget.classList.toggle("open")
  }

  close(event) {
    // Close menu when clicking outside on mobile
    if (!this.navTarget.contains(event.target) && this.navTarget.classList.contains("open")) {
      this.navTarget.classList.remove("open")
    }
  }
}
