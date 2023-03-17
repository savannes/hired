import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = ["listItem", "button"]

  editJob(button) {
    ModalController.prototype.editJob.call(this, button);
  }

  connect() {
      const items = this.listItemTargets
      const button = this.buttonTarget;

      button.addEventListener("click", this.editJob.bind(this));

      var clickedTarget = null;
      var droppedTarget = null;

      var move = (id, columnId) => {
        const url = `/move/${id}`;
        const data = { column_id: columnId };

        fetch(url, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
          },
          body: JSON.stringify(data),
        });
      }

    const findParent = (element, className, onFind) => {
      let foundParent = false;
      let currentElement = element;

      while (!foundParent) {
        try {
          if (currentElement.className.includes(className)) {
            return onFind(currentElement);
          } else {
            currentElement = currentElement.parentElement;
          }
        } catch (error) {
          console.warn("Couldn't find parent");
          break;
        }
      }
    };

    const moveElement = (targetList, position, targetElement) => {

      droppedTarget = targetList;
      const droppedColumn = document.getElementById(`list-${targetList.id}`);
      const index = Array.from(droppedColumn.children).indexOf(targetElement);

      const oldList = clickedTarget;
      const newIndex = position === "top" ? index : index + 1;

      droppedColumn.insertBefore(clickedTarget, droppedColumn.children[newIndex]);
      move(clickedTarget.id, targetList.id)

      clickedTarget = null;
    }

      items.forEach((item) => {
        item.addEventListener("mousedown", (event) => {
          event.preventDefault();
          const clickedItem = findParent(event.target, "list-item", (currentElement) => currentElement);

          if (clickedItem && !clickedTarget) {
            const clickedButton = findParent(event.target, "button", (currentElement) => currentElement);

            if (!clickedButton) {
              // clicked inside the LI, enable move action
              droppedTarget = null;
              clickedTarget = clickedItem;
            }
          }
        });
      })

      document.addEventListener("mouseup", (event) => {
        let targetList = event.target;
        let foundParent = false;
        let targetElement = null;
        let position = null;

        if (event.target === button) {
          this.editJob();
        } else {
            while (!foundParent) {
              try {
                const tag = targetList.tagName;
                // console.log("tag", tag);
                if (tag == "LI") {
                  // console.log("entrei");
                  const element = event.target.getBoundingClientRect();
                  const cursorPosition = event.clientY - element.top;
                  const elementHeight = targetList.clientHeight;
                  const middle = elementHeight / 2;
                  position = cursorPosition >= middle ? "bottom" : "top";
                  targetElement = targetList;
                }

                if (targetList.tagName == "DIV" && targetList.className == "list") {
                  moveElement(targetList, position, targetElement);
                  break;
                } else {
                  try {
                    targetList = targetList.parentElement;
                  } catch (error) {
                    break;
                  }
                }
              } catch (error) {
                break;
              }
            }
          }
      });
    }
    editJob() {
    }
  }
