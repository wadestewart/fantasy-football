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

team_data = get_team_data()

team_data.each do |team|
    # p team
    Team.create!({
        name:   team[1][:name],
        img:    team[1][:img]
    })
end

# https://stackoverflow.com/questions/14374695/saving-external-json-to-db-with-rails
def players_save_data_from_api
    response = HTTParty.get('http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2017&format=json')
    player_data = JSON.parse(response.body)
    players = player_data["players"]
    # p players
    players.each_with_object({}) do |player|
        # p player
        create_player = Player.create!({name: player[:name], nfl_team: player[:teamAbbr], position: player[:position], rank: player[:seasonPts]})
    end
end

players_save_data_from_api


# players_save_data_from_api.each do |team_name, players|
#     info = team_data[team_name]
#     current_team = Team.create!({
#         name:   info[:name],
#         img:    info[:img]    
#     })

    # players.each do |player|
    #     Player.create!({
    #         name:       player[:name],
    #         nfl_team:   player[:teamAbbr],
    #         position:   player[:position],
    #         rank:       players[:seasonPts]
    #     })
    # end
# end
