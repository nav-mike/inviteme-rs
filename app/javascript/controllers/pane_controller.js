import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["value"];

  drawPane() {
    this.valueTarget.classList.add("text-blue-700");
  }

  unDrawPane() {
    this.valueTarget.classList.remove("text-blue-700");
  }
}
