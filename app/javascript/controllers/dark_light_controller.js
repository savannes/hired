import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]
  static values = { mode: String }

  connect() {
    this.modeValueChanged();
    const mode = localStorage.getItem("mode") ?? "light";
    this.modeValue = mode;
  }

  toggleMode() {
    const mode = localStorage.getItem("mode") ?? "light";
    localStorage.setItem("mode", mode === "light" ? "dark" : "light");
    this.modeValue = mode === "light" ? "dark" : "light";
  }

  modeValueChanged() {
    this.iconTarget.classList.toggle("bi-brightness-high", this.modeValue === "light");
    this.iconTarget.classList.toggle("bi-moon", this.modeValue === "dark");
  }
}
