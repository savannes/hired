import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]
  static values = { mode: String }

  connect() {
    this.modeValueChanged()
  }

  toggleMode() {
    this.modeValue = this.modeValue === "light" ? "dark" : "light"
    this.modeValueChanged()
  }
}
