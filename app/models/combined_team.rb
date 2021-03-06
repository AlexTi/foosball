class CombinedTeam
  def initialize teams_to_combine
    @teams_to_combine = teams_to_combine
  end

  def name
    @teams_to_combine.first.name
  end

  def matches
    @teams_to_combine.collect(&:matches).collect(&:finished).flatten
  end

  def points
    @teams_to_combine.map(&:points).reduce(:+)
  end

  def goals
    @teams_to_combine.map(&:goals).reduce(:+)
  end

  def goals_conceded
    @teams_to_combine.map(&:goals_conceded).reduce(:+)
  end

  def to_param
    @teams_to_combine.first.to_param
  end
end
