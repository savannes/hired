import {
  Modal
} from "bootstrap"
import {
  Controller
} from "@hotwired/stimulus"
export default class extends Controller {
  connect() {
    console.log("entrei");
    const modal = document.querySelector(".my-modal");
    const buttons = document.getElementsByClassName("my-modal");

    buttons.forEach((button) => {
      button.addEventListener("click",() => {
        console.log("cliquei");
      })
    })
  }
}
