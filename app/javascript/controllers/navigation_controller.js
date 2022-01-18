import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['content', 'loading'];

  displayLoading(event) {
    console.log('event.target');
    this.loadingTarget.classList.remove('hidden');
    this.contentTarget.classList.add('hidden');
  }

  displayContent() {
    this.loadingTarget.classList.add('hidden');
    this.contentTarget.classList.remove('hidden');
  }
}
