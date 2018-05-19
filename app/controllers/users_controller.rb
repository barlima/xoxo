class UsersController < ApplicationController

  after_action :display_starting_user, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.set_room

    respond_to do |format|
      if @user.save
        cookies[:xoxo_player] = @user.nickname
        format.html { redirect_to room_path(@user.room_id) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end

  def display_starting_user
    @user = User.last
    if @user.room.full?
      ActionCable.server.broadcast 'player_channel', {
        nickname: @user.nickname,
        starting_player: @user.room.active_player,
        inactive_player: @user.room.inactive_player
      }
    end
  end
end
