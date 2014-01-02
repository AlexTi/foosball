class Team < ActiveRecord::Base
  belongs_to :forward_player, class_name: 'Player'
  belongs_to :defense_player, class_name: 'Player'

  has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id
  has_many :away_matches, class_name: 'Match', foreign_key: :away_team_id

  scope :with_matches, -> { joins("INNER JOIN matches ON matches.home_team_id = teams.id OR matches.away_team_id = teams.id").group("teams.id").having("COUNT(matches.id) > 0") }

  validates :forward_player_id, :defense_player_id, presence: true

  def self.from_players forward_player: forward_player, defense_player: defense_player
    Team.where(forward_player_id: forward_player.id).where(defense_player_id: defense_player.id).first_or_create
  end

  def self.tag_team_for team
    Team.where(defense_player_id: team.forward_player_id)
        .where(forward_player_id: team.defense_player_id).first
  end

  def name
    if solo?
      self.defense_player.name
    else
      [self.defense_player.name, self.forward_player.name].to_sentence
    end
  end

  def solo?
    self.defense_player_id == self.forward_player_id
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

  def goals
    Statistics.goals_for_team self
  end

  def goals_conceded
    Statistics.goals_conceded_for_team self
  end
end
