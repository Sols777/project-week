import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collapsible"
export default class extends Controller {
  connect() { console.log("connected")

  // Get collapsible elements
  const collapsibles = document.querySelectorAll(".collapsible");

  // Loop through collapsibles
  collapsibles.forEach(item => {
    const header = item.querySelector("h2");
    const content = item.querySelector(".content");

    header.addEventListener("click", () => {
      console.log("Clicked!");
      item.classList.toggle("active");
    });

    });
  }


}
