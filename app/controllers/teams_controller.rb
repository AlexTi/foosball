class TeamsController < ApplicationController

  def show
    team = Team.find(params[:id])
    tag_team = Team.tag_team_for team

    @team = CombinedTeam.new([team, tag_team])
  end
end
