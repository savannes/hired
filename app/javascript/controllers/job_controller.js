import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="job"
export default class extends Controller {
  static targets = ["listItems"]

  addCard() {
    const li = document.createElement("li")
    li.textContent = "New card"
    this.listItemsTarget.appendChild(li)
  }
}
