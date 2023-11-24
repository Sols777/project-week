document.addEventListener('DOMContentLoaded', () => {
  console.log("Clicked!");
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

});
