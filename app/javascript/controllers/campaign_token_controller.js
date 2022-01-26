import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'token', 'copyIcon', 'name' ]

  code = null
  touched = 0

  connect() {
    this.touched = this.nameTarget.value.length > 0 ? 1 : 0;
  }

  async getToken() {
    const response = await fetch('/api/campaigns/generate_token', {
      method: 'GET',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    })
    const data = await response.json();
    this.code = data.token;
  }

  async generateUniqCode() {
   await this.getToken();
    this.updateCopyIcon(false);
  }

  async touchName() {
    this.touched += 1
    if (this.touched === 1 && this.code === null) {
      await this.regenerateToken();
    }
  }

  async regenerateToken() {
    await this.generateUniqCode()
    this.tokenTarget.value = this.code
  }

  copyToClipboard(event) {
    event.preventDefault();
    if (this.code) {
      navigator.clipboard.writeText(this.code);
      this.updateCopyIcon(true);
    }
  }

  updateCopyIcon(copied) {
    if (copied) {
      this.copyIconTarget.classList.add('fa-check', 'text-green-600')
      this.copyIconTarget.classList.remove('fa-files-o')
    } else {
      this.copyIconTarget.classList.remove('fa-check', 'text-green-600')
      this.copyIconTarget.classList.add('fa-files-o')
    }
  }
}
