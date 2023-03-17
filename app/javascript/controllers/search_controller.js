import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "cards"];

  connect() {
    console.log("connected")
  }



  search() {
    const query = this.inputTarget.value.toLowerCase();
    this.resetSearch();
    const cards = this.cardsTargets;
    cards.forEach((card) => {
      if (!card.dataset.keywords.includes(query) && query !== "") {
        card.classList.add("d-none")
      }
    })
  }

  resetSearch() {
    const cards = this.cardsTargets;
    cards.forEach((card) => {
      card.classList.remove("d-none")
    })

  }

  searchRole(event) {
    this.resetSearch();
    const cards = this.cardsTargets;
    const query = event.target.value;
    cards.forEach((card) => {
      if (card.dataset.role !== query && query !== "") {
        card.classList.add("d-none")
      }
    })
  }

  searchInputLevel(event) {
    this.resetSearch();
    const cards = this.cardsTargets;
    const query = event.target.value;
    cards.forEach((card) => {
      if (card.dataset.level !== query && query !== "") {
        card.classList.add("d-none")
      }
    })
  }

  searchJobType(event) {
    this.resetSearch();
    const cards = this.cardsTargets;
    const query = event.target.value;
    cards.forEach((card) => {
      if (card.dataset.job_type !== query && query !== "") {
        card.classList.add("d-none")
      }
    })
  }
}
