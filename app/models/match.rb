class PlayerNotInBothTeams < ActiveModel::Validator
  def validate(record)
    player_in_both_teams = (record.try(:home_team).try(:player_ids) & record.try(:away_team).try(:player_ids))

    if player_in_both_teams.any?
      player_in_both_teams.each do |player_id|
        player = Player.find player_id
        record.errors[:players] << "Player #{player.name} can't play for both teams"
      end
    end
  end
end

class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  scope :finished,    -> { where.not(home_team_score: nil).where.not(away_team_score: nil) }
  scope :unfinished,  -> { where(home_team_score: nil).where(away_team_score: nil) }

  validates :away_team_id, :home_team_id, presence: true
  validates_with PlayerNotInBothTeams

  def winner
    if self.home_team_score > self.away_team_score
      self.home_team
    else
      self.away_team
    end
  end
end
