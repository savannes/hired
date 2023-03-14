import { Application } from "@hotwired/stimulus"
import ModalController from "./modal_controller"

const application = Application.start()

application.debug = false
window.Stimulus   = application

export { application }
