class Team < ActiveRecord::Base
  belongs_to :forward_player, class_name: 'Player'
  belongs_to :defense_player, class_name: 'Player'

  has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id
  has_many :away_matches, class_name: 'Match', foreign_key: :away_team_id

  def self.from_players forward_player: forward_player, defense_player: defense_player
    Team.where(forward_player_id: forward_player.id).where(defense_player_id: defense_player.id).first_or_create
  end

  def matches
    (home_matches + away_matches).uniq
  end
end
