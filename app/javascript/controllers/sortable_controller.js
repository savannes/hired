import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = ["listItem"]

  connect() {
    
      const items = this.listItemTargets
      // var items = document.getElementsByClassName("list-item");
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
      })
      }
    
      items.forEach((item) => {
        item.addEventListener("mousedown", (event) => {
        event.preventDefault();
        const clickedItem = event.target.parentElement.parentElement;

        if (clickedItem.tagName == "A" && !clickedTarget) {
          droppedTarget = null;
          clickedTarget = clickedItem;
        }
      });
      })

      document.addEventListener("mouseup", (event) => {
        let targetList = event.target;
        let foundParent = false;

        while (!foundParent) {
          try {
            const tag = targetList.tagName;
            // if (tag == "LI") {
            //   const elementHeight = targetList.clientHeight;
            // }
          } catch (error) {
            break;
          }

          if (targetList.tagName == "DIV" && targetList.className == "list") {
            foundParent = true;
          } else {
            try {
              targetList = targetList.parentElement;
            } catch (error) {
              break;
            }
          }
        }

        if (foundParent && !droppedTarget && clickedTarget) {
          droppedTarget = targetList;
          const droppedColumn = document.getElementById(`list-${targetList.id}`);
          const oldList = clickedTarget.parentElement;

          droppedColumn.appendChild(clickedTarget);
          move(clickedTarget.id, targetList.id)
          
          clickedTarget = null;
        }
      });
    }
  }
