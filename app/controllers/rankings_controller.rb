class RankingsController < ApplicationController
  def index
    @teams = Team.all.sort_by(&:points).reverse
  end
end
