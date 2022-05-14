import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    this.timeout = setInterval(() => { this.element.reload() }, 5000)
  }

  disconnect() {
    clearInterval(this.timeout)
  }
}