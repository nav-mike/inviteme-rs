import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["js", "api", "apiTab", "jsTab"];

  tabClasses = ["bg-slate-100", "border-r-2", "border-t-2", "border-l-2", "rounded-t-md"]

  showJs(event) {
    event.preventDefault();

    this.jsTarget.classList.remove("hidden");
    this.apiTarget.classList.add("hidden");

    this.disableTab(this.apiTabTarget)

    this.enableTab(this.jsTabTarget)
  }

  showApi(event) {
    event.preventDefault();

    this.jsTarget.classList.add("hidden");
    this.apiTarget.classList.remove("hidden");

    this.enableTab(this.apiTabTarget)

    this.disableTab(this.jsTabTarget)
  }

  enableTab(target) {
    this.tabClasses.forEach((c) => target.classList.add(c))
    target.classList.remove('border-b-2')
  }

  disableTab(target) {
    this.tabClasses.forEach((c) => target.classList.remove(c))
    target.classList.add('border-b-2')
  }
}
