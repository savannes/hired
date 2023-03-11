import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["form","title"]
  connect() {
    const jobModal = this.element
    jobModal.addEventListener('show.bs.modal', event => {
    const button = event.relatedTarget
    const route = button.getAttribute('data-bs-route')
    console.log(route === "add");
    if (route === "add") {
      this.newJob(button)
    } else {
      this.editJob(button)
    }
    })
  }
  newJob(button) {
    this.clearPatchInputs()
    this.resetInputs()
    const column = button.getAttribute('data-bs-column')
    const columnName = button.getAttribute('data-bs-column-name')
    const url = `/columns/${column}/jobs`
    this.formTarget.action = url;
    this.titleTarget.textContent = `Add new job to ${columnName}`
    console.log(url);
  }
  editJob(button) {
    this.clearPatchInputs()
    const patchInput = '<input class="patch_input" type="hidden" name="_method" value="patch" autocomplete="off">'
    this.formTarget.insertAdjacentHTML("afterbegin", patchInput)
    this.fillInputs(button)
    const id = button.getAttribute('data-bs-job-id')
    const url = `/jobs/${id}`
    this.formTarget.action = url;
    console.log(this.formTarget.action);
    this.titleTarget.textContent = `Edit job`
  }
  clearPatchInputs() {
    document.querySelectorAll(".patch_input").forEach((element) => {
      element.remove()
    })
  }

  fillInputs(button) {
    document.getElementById("job_company").value = button.getAttribute('data-bs-job-company')
    document.getElementById("job_salary").value = button.getAttribute('data-bs-job-salary')
    document.getElementById("job_role").value = button.getAttribute('data-bs-job-role')
    document.getElementById("job_level").value = button.getAttribute('data-bs-job-level')
    document.getElementById("job_description").value = button.getAttribute('data-bs-job-description')
    document.getElementById("job_job_type").value = button.getAttribute('data-bs-job-job-type')
    document.getElementById("job_application_link").value = button.getAttribute('data-bs-job-application-link')
  }

  resetInputs() {
    document.getElementById("job_company").value = ""
    document.getElementById("job_salary").value = ""
    document.getElementById("job_role").value = ""
    document.getElementById("job_level").value = ""
    document.getElementById("job_description").value = ""
    document.getElementById("job_job_type").value = ""
    document.getElementById("job_application_link").value = ""
  }
}
