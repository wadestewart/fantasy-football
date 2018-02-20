class Player < ActiveRecord::Base
    belongs_to :team
    require 'httparty'

    response = HTTParty.get('http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2017&format=json', format: :json)

    players = response["players"]

    players.each do |player|
        player = self.find_by(name: player)
            if player == nil
                self.create!(name: player)
            end
    end
end
