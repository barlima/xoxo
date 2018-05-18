class GamesController < ApplicationController

  def update
    @game = Game.find(params[:id])
    @game.turn = @game.turn == 1 ? 2 : 1
    @game.save
    head :ok
  end

  def give_up
    @game = Game.find(params[:id])
    @user_won = @game.room.users.find_by(nickname: params[:nickname])
    @user_lost
  end

end
