import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["copyIcon", "token"];

  copyToClipboard(event) {
    event.preventDefault();
    navigator.clipboard.writeText(this.tokenTarget.innerText);
  }
}
