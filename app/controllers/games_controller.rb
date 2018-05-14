class GamesController < ApplicationController

  def update
    @game = Game.find(params[:id])
    @game.turn = @game.turn == 1 ? 2 : 1
    @game.save
    head :ok
  end

end
