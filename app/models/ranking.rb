class Ranking
  attr_reader :name

  def initialize name, teams, options = {}
    @name = name
    @teams = teams.sort_by { |t| [t.points, t.goals] }.reverse
    @options = options
  end

  # HOLY, rewrite this!
  def combined_teams
    @combined_teams = []

    0.upto(@teams.size - 1) do |index|
      combined = false
      team = @teams[index]

      next if team.nil?

      index.upto(@teams.size - 1) do |search_index|
        searched_team = @teams[search_index]
        next if searched_team.nil?

        if team.forward_player_id == searched_team.defense_player_id &&
            team.defense_player_id == searched_team.forward_player_id
          combined = true
          @combined_teams << CombinedTeam.new([team, searched_team])
          @teams[search_index] = nil
        end
      end

      @combined_teams << team unless combined
    end

    @combined_teams
  end

  def each_team
    if @options[:combine]
      combined_teams.each { |team| yield team }
    else
      @teams.each { |team| yield team }
    end
  end
end
