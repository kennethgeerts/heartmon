import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'heartRate', 'measuredAt', 'heartEmoji' ]
  static values = { team: Object }

  connect() {
    const url = `wss://dev.pulsoid.net/api/v1/data/real_time?access_token=${this.teamValue.token}`
    const socket = new WebSocket(url)
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
