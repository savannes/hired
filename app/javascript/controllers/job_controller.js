import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';

// Connects to data-controller="job"
export default class extends Controller {
  // static targets = ["listItems"]

  // addCard() {
  //   const li = document.createElement("li")
  //   const form = document.createElement("form")
  //   const input = document.createElement("input")
  //   input.type = "text"
  //   input.name = "cardContent"
  //   form.appendChild(input)
  //   li.appendChild(form)
  //   this.listItemsTarget.appendChild(li)
  // }

  connect() {
    super.connect()
    console.log('Do what you want here.')
    Sortable.create(this.element, {
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        alert(`${event.oldIndex} moved to ${event.newIndex}`);
      }
    });
  }
}

// connect : onEnd: this.updatePosition.bind(this)
