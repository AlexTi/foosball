class Statistics

  POINTS_FOR_WINNING = 2

  def self.points_for_team team
    team.matches.finished.select { |m| m.winner == team }.count * POINTS_FOR_WINNING
  end

  def self.goals_for_team team
    team.home_matches.finished.map(&:home_team_score).reduce(0, :+) +
    team.away_matches.finished.map(&:away_team_score).reduce(0, :+)
  end

  def self.goals_conceded_for_team team
    team.home_matches.finished.map(&:away_team_score).reduce(0, :+) +
    team.away_matches.finished.map(&:home_team_score).reduce(0, :+)
  end
end
