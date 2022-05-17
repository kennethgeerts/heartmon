class DataCollectionJob < ApplicationJob
  queue_as :default

  def perform(game)
    sockets = game.teams.map { |team| [team, WebSocket::Client::Simple.connect(team.ws_url)] }

    sockets.each do |team, socket|
      socket.on(:message) do |event|
        sockets.each(&:close) if game.reload.ended?

        message = JSON.parse(event.data)
        heart_rate = message['data']['heart_rate']
        measured_at = Time.at(0, message['measured_at'], :millisecond)

        team.add_heart_rate(heart_rate, measured_at)
      end
    end
  end
end
