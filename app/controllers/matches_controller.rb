class MatchesController < ApplicationController

  def index
    @finished_matches = Match.finished.order('created_at DESC')
    @unfinished_matches = Match.unfinished.order('created_at DESC')
  end

  def new
    @players = Player.all
  end

  def edit
    @match = Match.find params[:id]
  end

  def update
    match = Match.find params[:id]

    match.update_attributes params.require(:match).permit(:home_team_score, :away_team_score)
    redirect_to matches_path
  end

  def create
    forward_home = Player.find params[:forward_home][:player_id]
    defense_home = Player.find params[:defense_home][:player_id]
    forward_away = Player.find params[:forward_away][:player_id]
    defense_away = Player.find params[:defense_away][:player_id]

    home_team = Team.from_players forward_player: forward_home, defense_player: defense_home
    away_team = Team.from_players forward_player: forward_away, defense_player: defense_away
    match = Match.create! home_team: home_team, away_team: away_team
    redirect_to edit_match_path match
  end
end
