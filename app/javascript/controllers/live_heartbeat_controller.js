import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'heartRate', 'measuredAt', 'heartEmoji' ]
  static values = { team: Object }

  connect() {
    const socket = new WebSocket(this.teamValue.ws_url)
    socket.onmessage = (event) => {
      const message = JSON.parse(event.data)
      console.log(message)
      this.updateTargets(message)
    }
  }

  updateTargets(message) {
    const heartRate = message.data.heart_rate
    const measuredAt = new Date(message.measured_at)?.toLocaleTimeString()

    this.heartRateTarget.textContent = heartRate
    this.measuredAtTarget.textContent = measuredAt
    this.heartEmojiTarget.textContent = heartRate > 0 ? '❤️' : '🤍'
  }
}
