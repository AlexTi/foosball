class RankingsController < ApplicationController
  def index
    @rankings = [ Ranking.new("Teams Combined", Team.with_matches.reject{|t| t.solo? }, combine: true),
                  Ranking.new("Teams", Team.with_matches.reject{|t| t.solo? }),
                  Ranking.new("Single", Team.with_matches.select{|t| t.solo? }),
                  Ranking.new("Overall", Team.with_matches)
                ]
  end
end
