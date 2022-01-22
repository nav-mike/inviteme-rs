import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'token' ]

  code = null
  touched = 0

  async generateUniqCode() {
    let used;
    let token;
    do {
      token = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15)
      const result = await fetch(`/api/campaigns/uniq_token?token=${token}`, {
        method: 'GET',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      })
      const data = await result.json()
      used = data.used;
    } while (used != 0)
    this.code = token;
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
    }
  }
}
