class Player < ActiveRecord::Base
  has_many :teams_as_forward, class_name: "Team", foreign_key: :forward_player_id
  has_many :teams_as_defender, class_name: "Team", foreign_key: :defense_player_id

  def teams
    t = Team.arel_table

    Team.where(
      t[:forward_player_id].eq(self.id).
      or(t[:defense_player_id].eq(self.id))
    ).uniq
  end

  def matches
    teams.collect(&:matches).flatten.uniq
  end
end
