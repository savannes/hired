import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["listItem", "button", "dragHandle"];

  editJob(button) {
    ModalController.prototype.editJob.call(this, button);
  }

  connect() {
    const items = this.listItemTargets;
    const button = this.hasButtonTarget ? this.buttonTarget : null;
    if (button) {
      button.addEventListener("click", this.editJob.bind(this));
    }

    var clickedTarget = null;
    var droppedTarget = null;
    var clone = null;

    var move = (id, columnId, position) => {
      const url = `/move/${id}`;
      const data = { column_id: columnId, position };
      fetch(url, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        },
        body: JSON.stringify(data),
      });
    };

    const createClone = (element) => {
      clone = element.cloneNode(true);
      clone.style.position = "fixed";
      clone.style.pointerEvents = "none";
      clone.style.opacity = "0.8";
      document.body.appendChild(clone);
    };

    const removeClone = () => {
      if (clone) {
        clone.remove();
        clone = null;
      }
    };

    const updateClonePosition = (event) => {
      if (clone) {
        clone.style.top = event.clientY + "px";
        clone.style.left = event.clientX + "px";
      }
    };

    const findParent = (element, className, onFind) => {
      let currentElement = element;
      while (currentElement) {
        if (currentElement.classList.contains(className)) {
          return onFind(currentElement);
        }
        currentElement = currentElement.parentElement;
      }
    };

    const moveElement = (targetList, position, targetElement) => {
      droppedTarget = targetList;
      const droppedColumn = document.getElementById(`list-${targetList.id}`);
      const index = Array.from(droppedColumn.children).indexOf(targetElement);

      const oldList = clickedTarget;
      const newIndex = position === "top" ? index : index + 1;

      droppedColumn.insertBefore(clickedTarget, droppedColumn.children[newIndex]);
      move(clickedTarget.id, targetList.id, newIndex);

      clickedTarget = null;
    };

    items.forEach((item) => {
      item.addEventListener("mousedown", (event) => {
        const clickedItem = findParent(event.target, "list-item", (currentElement) => currentElement);
        const clickedButton = findParent(event.target, "button", (currentElement) => currentElement);
        const clickedHandle = findParent(event.target, "drag-handle", (currentElement) => currentElement);

        if (!clickedButton) {
          if (clickedItem && !clickedTarget) {
            droppedTarget = null;
            clickedTarget = clickedItem;
            createClone(clickedItem);
            updateClonePosition(event);
          }
        }
      });

      document.addEventListener("mousemove", (event) => {
        if (clone) {
          updateClonePosition(event);
        }
      });

      document.addEventListener("mouseup", (event) => {
        if (clickedTarget) {
          removeClone();

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
                if (tag === "LI") {
                  const element = event.target.getBoundingClientRect();
                  const cursorPosition = event.clientY - element.top;
                  const elementHeight = targetList.clientHeight;
                  const middle = elementHeight / 2;
                  position = cursorPosition >= middle ? "bottom" : "top";
                  targetElement = targetList;
                }

                if (targetList.tagName === "DIV" && targetList.className === "list") {
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
        }
        this.editJob();
      });
    });
  }
}
