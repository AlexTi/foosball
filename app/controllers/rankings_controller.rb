class RankingsController < ApplicationController
  def index
    @teams = Team.all.sort_by { |t| [t.points, t.goals] }.reverse
  end
end
