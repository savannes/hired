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
    // Sortable.create(this.element, {
    //   swapThreshold: 1,
    //   swap: true, // Enable swap plugin
	  //   swapClass: 'highlight', // The class applied to the hovered swap item
    //   ghostClass: "ghost",
    //   animation: 150,
    //   direction: "both",
    //   onEnd: (event) => {
    //     if (event.to.id === "right-column") {
    //       // The item was dropped in the right column
    //       const item = event.item;
    //       const rightColumn = document.getElementById("right-column");
    //       rightColumn.appendChild(item);
    //     }
    //   }
    // });
  }
}

// connect : onEnd: this.updatePosition.bind(this)
