class Statistics

  POINTS_FOR_WINNING = 2

  def self.points_for_team team
    team.matches.finished.select { |m| m.winner == team }.count * POINTS_FOR_WINNING
  end
end
