import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches
    const saved = localStorage.getItem("theme")
    document.documentElement.classList.toggle(
      "dark",
      saved ? saved === "dark" : prefersDark
    )
  }
  toggle() {
    const next = document.documentElement.classList.toggle("dark") ? "dark" : "light"
    localStorage.setItem("theme", next)
  }
}
