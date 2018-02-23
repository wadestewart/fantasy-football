class TeamsController < ApplicationController

    #Root page for the app, renders all Teams from the Postgresql table 'teams'
    def index
        @teams = Team.all
    end 

    

end
