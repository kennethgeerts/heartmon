import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'heartRate', 'heartEmoji' ]
  static values = { team: Object }

  connect() {
    const socket = new WebSocket(this.teamValue.ws_url)
    socket.onmessage = (event) => {
      const message = JSON.parse(event.data)
      this.heartRateTarget.textContent = message.data.heart_rate
      this.heartEmojiTarget.textContent = heartRate > 0 ? '❤️' : '🤍'
    }
  }
}
