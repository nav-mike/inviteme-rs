import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['icon', 'input']

  state = false;

  togglePassword() {
    this.state = !this.state;
    if (this.state) {
      this.iconTarget.classList.add('fa-eye');
      this.iconTarget.classList.remove('fa-eye-slash');
      this.inputTarget.type = 'text';
    } else {
      this.iconTarget.classList.add('fa-eye-slash');
      this.iconTarget.classList.remove('fa-eye');
      this.inputTarget.type = 'password';
    }
  }
}
