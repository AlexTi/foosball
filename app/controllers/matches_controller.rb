class MatchesController < ApplicationController

  def index
    @players = Player.all
    @matches = Match.all

  end

  def create
    binding.pry
  end

end
