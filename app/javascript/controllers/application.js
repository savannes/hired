import { Application } from "@hotwired/stimulus"
import JobController from "./job_controller"
import ModalController from "./modal_controller"

const application = Application.start()
application.register("add-card", JobController)


// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
