class GamesController < ApplicationController

  def update
    @game = Game.find(params[:id])
    @game.turn = @game.turn == 1 ? 2 : 1
    @game.save
    head :ok
  end

  def give_up
    @game = Game.find(params[:id])
    @user_lost = @game.room.users.find_by(nickname: params[:nickname])
    @user_won = @game.room.get_oponent_for(@user_lost)
    @user_won.won += 1
    @user_lost.lost += 1
    @user_lost.set_room

    if @user_lost.save
      redirect_to room_path(@user_lost.room_id)
      # ToDo:
      # Show the other user a modal
      # @game.room.destroy
      # @game.destroy
    else
      # Display something went wrong
    end

  end

end
