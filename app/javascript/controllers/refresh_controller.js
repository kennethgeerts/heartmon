import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    rate: { type: Number, default: 2 }
  }

  connect() {
    this.timeout = setInterval(() => { this.element.reload() }, this.rate)
  }

  disconnect() {
    clearInterval(this.timeout)
  }

  get rate() {
    return this.rateValue * 1000
  }
}
