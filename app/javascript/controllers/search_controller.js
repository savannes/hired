import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "cards"];

  connect() {
  }
  
  search() {
    const query = this.inputTarget.value.toLowerCase();
    const cards = this.cardsTargets;
    cards.forEach((card) => {
      card.classList.remove("d-none")
    })
    cards.forEach((card) => {
      if (!card.dataset.keywords.includes(query) && query !== "") {
        card.classList.add("d-none")
      }
    })
  }
}
