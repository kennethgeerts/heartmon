game = Game.create(
  name:     'TestGame',
  client:   'Time Out',
  start_at: '2022-05-18 10:00:00',
  stop_at:  '2022-05-18 17:00:00'
)

game.teams.create(
  name:     'Rob',
  username: 'info+test1@time-out.com',
  password: 'info+test1',
  token:    '9c95031f-f7e3-4ef0-a966-613215aa0e75',
  code:     'SP1ROB'
)

game.teams.create(
  name:     'Joris',
  username: 'info+test2@time-out.com',
  password: 'info+test2',
  token:    '4fb0cd74-fed5-42c2-af28-89d78e0faa16',
  code:     'SP1JOR'
)

game.teams.create(
  name:     'Kenneth',
  username: 'info+test3@time-out.com',
  password: 'info+test3',
  token:    '41e67409-2356-4cb2-b54f-90f61c6629cd',
  code:     'SP1KEN'
)

RATES = (40..140).to_a
game.teams.each do |team|
  100.downto(1) do |i|
    team.add_heart_rate(RATES.sample, i.seconds.ago)
  end
end
