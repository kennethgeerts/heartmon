game = Game.create(
  name:     'Fros Challenge',
  client:   'Fros',
  start_at: '2022-08-11 10:00:00',
  stop_at:  '2022-08-11 16:00:00'
)

game.teams.create(
  name:     'Team 1',
  username: 'info+test1@time-out.com',
  password: 'info+test1',
  token:    '9c95031f-f7e3-4ef0-a966-613215aa0e75'
)

game.teams.create(
  name:     'Team 2',
  username: 'info+test2@time-out.com',
  password: 'info+test2',
  token:    '4fb0cd74-fed5-42c2-af28-89d78e0faa16'
)

game.teams.create(
  name:     'Team 3',
  username: 'info+test3@time-out.com',
  password: 'info+test3',
  token:    '41e67409-2356-4cb2-b54f-90f61c6629cd'
)

game.teams.create(
  name:     'The Shooting Stars',
  username: 'info+test4@time-out.com',
  password: 'info+test4',
  token:    '23bea528-0df4-4acf-8bca-08e8f5eff32a'
)

game.teams.create(
  name:     'Team 5',
  username: 'info+test5@time-out.com',
  password: 'info+test5',
  token:    'a1a62309-0d03-4a87-a19b-f379db1f990c'
)


# For testing
# RATES = (40..140).to_a
# game.teams.each do |team|
#   100.downto(1) do |i|
#     team.add_heart_rate(RATES.sample, i.seconds.ago)
#   end
# end
