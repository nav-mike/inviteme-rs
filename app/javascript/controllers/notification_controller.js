import { Controller } from "@hotwired/stimulus";
import { destroy } from "@rails/request.js";

export default class extends Controller {
  static targets = ["notification", "progressbar"];

  connect() {
    const progressbar = this.progressbarTarget;
    let width = 1000;
    const id = setInterval(() => {
      if (width <= 0) {
        clearInterval(id);
        this.hide();
      } else {
        width--;
        progressbar.style.width = width / 10 + "%";
      }
    }, 10);
  }

  close(event) {
    event.preventDefault();
    this.hide();
  }

  hide() {
    this.notificationTarget.classList.add("disappear");
    setTimeout(async () => {
      this.notificationTarget.classList.add("hidden");
      await this.destroy(this.notificationTarget.id.match(/\d+/)[0]);
    }, 400);
  }

  async destroy(id) {
    await destroy(`/notifications/${id}.json`, {
      contentType: "application/json",
    });
  }
}
