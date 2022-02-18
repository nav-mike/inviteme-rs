import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  requestSubmit(event) {
    console.log("requestSubmit");
    event.preventDefault();
  }
}
