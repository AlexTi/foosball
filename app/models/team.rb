class Team < ActiveRecord::Base
  belongs_to :forward_player, class_name: 'Player'
  belongs_to :defense_player, class_name: 'Player'

  has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id
  has_many :away_matches, class_name: 'Match', foreign_key: :away_team_id

  validates :forward_player_id, :defense_player_id, presence: true

  def self.from_players forward_player: forward_player, defense_player: defense_player
    Team.where(forward_player_id: forward_player.id).where(defense_player_id: defense_player.id).first_or_create
  end

  def matches
    t = Match.arel_table

    Match.where(
      t[:home_team_id].eq(self.id).
      or(t[:away_team_id].eq(self.id))
    ).uniq
  end

  def players
    [forward_player, defense_player]
  end

  def player_ids
    players.collect(&:id)
  end

  def points
    Statistics.points_for_team self
  end
end
