import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static targets = ["token"];
  static values = {
    url: String,
    token: String,
  };

  async regenerateToken(event) {
    event.preventDefault();
    const response = await get(`${this.urlValue}.json`);
    if (!response.ok) throw "Unexpected server error";

    const data = await response.json;
    this.tokenTarget.value = data.token;
  }
}
