import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'token' ]

  code = null
  touched = 0

  generateUniqCode() {
    this.code = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15)
  }

  touchName() {
    this.touched += 1
    if (this.touched === 1 && this.code === null) {
      this.regenerateToken();
    }
  }

  regenerateToken() {
    this.generateUniqCode()
    this.tokenTarget.value = this.code
  }

  copyToClipboard(event) {
    event.preventDefault();
    if (this.code) {
      navigator.clipboard.writeText(this.code);
    }
  }
}
