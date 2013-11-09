# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alex = Player.create! name: 'AlexTi'
ben = Player.create! name: 'beanieboi'
manni = Player.create! name: 'manni'
clemens = Player.create! name: 'clemens'

team1 = Team.create forward_player: alex, defense_player: ben
team2 = Team.create forward_player: clemens, defense_player: manni

match1 = Match.create home_team: team1, away_team: team2,
                      home_team_score: 10, away_team_score: 0

match2 = Match.create home_team: team1, away_team: team2,
                      home_team_score: 8, away_team_score: 0

match3 = Match.create home_team: team1, away_team: team2,
                      home_team_score: 9, away_team_score: 10
