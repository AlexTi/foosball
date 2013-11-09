class Player < ActiveRecord::Base
  has_many :teams_as_forward, class_name: "Team", foreign_key: :forward_player_id
  has_many :teams_as_defender, class_name: "Team", foreign_key: :defense_player_id

  def teams
    (teams_as_forward + teams_as_defender).uniq
  end
end
