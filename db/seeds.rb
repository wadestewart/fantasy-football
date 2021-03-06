# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'
require_relative './team_data.rb'

Player.destroy_all
Team.destroy_all

# Access team_data file and seeding the database with Team data - relative path to team_data required 
team_data = get_team_data()

team_data.each do |team|
    # p team
    Team.create!({
        name:   team[1][:name],
        img:    team[1][:img]
    })
end

# Make an external API call and use the response to seed Player data - HTTParty required for this
response = HTTParty.get('http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2017&format=json')
player_data = JSON.parse(response.body)
players = player_data["players"]
# p players
players.each do |player|
    # p player
    name = player["name"]
    nfl_team = player["teamAbbr"]
    position = player["position"]
    rank = player["seasonPts"]
    # p name, nfl_team, position, rank
    Player.create!({name: name, nfl_team: nfl_team, position: position, rank: rank})
end

