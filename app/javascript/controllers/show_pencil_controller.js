import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["pencil"];

  show() {
    this.pencilTarget.classList.remove("hidden");
  }

  hide() {
    this.pencilTarget.classList.add("hidden");
  }
}
