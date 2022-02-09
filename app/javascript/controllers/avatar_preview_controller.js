import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["avatarImg", "avatarIcon", "avatarInput"];

  connect() {
    this.avatarInputTarget.onchange = () => {
      const [file] = this.avatarInputTarget.files;
      if (file) {
        this.avatarIconTarget.classList.add("hidden");
        this.avatarImgTarget.classList.remove("hidden");
        this.avatarImgTarget.src = URL.createObjectURL(file);
      }
    };
  }

  disconnect() {
    this.avatarInputTarget.removeEventListener("change", () => {});
  }
}
