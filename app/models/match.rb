class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  scope :finished,    -> { where.not(home_team_score: nil).where.not(away_team_score: nil) }
  scope :unfinished,  -> { where(home_team_score: nil).where(away_team_score: nil) }

  def winner
    if self.home_team_score > self.away_team_score
      self.home_team
    else
      self.away_team
    end
  end
end
