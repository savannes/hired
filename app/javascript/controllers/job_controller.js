import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="job"
export default class extends Controller {
  static targets = ["listItems"]

  addCard() {
    const li = document.createElement("li")
    const form = document.createElement("form")
    const input = document.createElement("input")
    input.type = "text"
    input.name = "cardContent"
    form.appendChild(input)
    li.appendChild(form)
    this.listItemsTarget.appendChild(li)
  }
}
