import { Controller } from "@hotwired/stimulus";
import { destroy } from "@rails/request.js";

export default class extends Controller {
  static targets = ["notification"];

  close(event) {
    event.preventDefault();
    this.hide(async () => {
      await this.destroy(this.notificationTarget.id.match(/\d+/)[0]);
    });
  }

  hide(callback) {
    this.notificationTarget.classList.add("disappear");
    setTimeout(() => {
      this.notificationTarget.classList.add("hidden");
      if (typeof callback === "function") callback();
    }, 400);
  }

  async destroy(id) {
    await destroy(`/notifications/${id}.json`, {
      contentType: "application/json",
    });
  }
}
