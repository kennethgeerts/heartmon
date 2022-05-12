class DataCollectionJob < ApplicationJob
  queue_as :default

  def perform(game)
    game.teams.each do |team|
      socket = WebSocket::Client::Simple.connect(team.ws_url)

      socket.on(:message) do |event|
        message = JSON.parse(event.data)
        heart_rate = message['data']['heart_rate']
        measured_at = Time.at(0, message['measured_at'], :millisecond)
        team.heart_rates.create(time: measured_at, rate: heart_rate)
      end
    end

    loop do
      if game.ended?
        break
      else
        sleep 5
      end
    end
  end
end
