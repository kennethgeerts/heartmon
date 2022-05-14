class DataCollectionJob < ApplicationJob
  queue_as :default

  def perform(game)
    game.teams.each do |team|
      socket = WebSocket::Client::Simple.connect(team.ws_url)

      socket.on(:message) do |event|
        message = JSON.parse(event.data)
        heart_rate = message['data']['heart_rate']
        measured_at = Time.at(0, message['measured_at'], :millisecond)

        team.add_heart_rate(heart_rate, measured_at)

        break if game.ended?
      end
    end
  end
end
