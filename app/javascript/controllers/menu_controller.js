import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menuDiv"];

  isShow = false;

  connect() {
    document.addEventListener("click", (event) => {
      if (event.target.id !== "menuImg" && event.target.id !== "menuLink") {
        this.isShow = false;
        this.toggleMenuDiv();
      }
    });
  }

  disconnect() {
    document.removeEventListener("click", () => {
      console.log(`click outside the menu`);
    });
  }

  toggleMenuDiv() {
    this.isShow
      ? this.menuDivTarget.classList.remove("hidden")
      : this.menuDivTarget.classList.add("hidden");
  }

  toggle(event) {
    event.preventDefault();

    this.isShow = !this.isShow;

    this.toggleMenuDiv();
  }
}
