class Team < ActiveRecord::Base
  belongs_to :forward_player, class_name: 'Player'
  belongs_to :defense_player, class_name: 'Player'

  has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id
  has_many :away_matches, class_name: 'Match', foreign_key: :away_team_id

  def matches
    (home_matches + away_matches).uniq
  end
end
