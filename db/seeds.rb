game = Game.create name: 'Game I', client: 'Coca Cola', start_at: '2022-05-05 10:00:00', stop_at: '2022-05-05 16:00:00'

Team.create name: 'Rob',     username: 'info+test1@time-out.com', password: 'info+test1', token: '9c95031f-f7e3-4ef0-a966-613215aa0e75', game: game
Team.create name: 'Joris',   username: 'info+test2@time-out.com', password: 'info+test2', token: '4fb0cd74-fed5-42c2-af28-89d78e0faa16', game: game
Team.create name: 'Kenneth', username: 'info+test3@time-out.com', password: 'info+test3', token: '41e67409-2356-4cb2-b54f-90f61c6629cd', game: game
