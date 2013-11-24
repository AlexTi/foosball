class Ranking
  attr_reader :name

  def initialize name, teams
    @name = name
    @teams = teams.sort_by { |t| [t.points, t.goals] }.reverse
  end

  def each_team
    @teams.each { |team| yield team }
  end
end
