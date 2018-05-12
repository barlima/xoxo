class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    set_room

    respond_to do |format|
      if @user.save
        format.html { redirect_to room_path(@user.room_id), notice: 'User was successfully created.' }
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

  def set_room
    room = Room.all.select{|r| !r.full?}.first
    if room
      ActionCable.server.broadcast 'player_channel', {nickname: @user.nickname} if room.has_awaiting_player?
      @user.room_id = room.id
    else
      room = Room.create!(name: Faker::Beer.unique.name)
      @user.room_id = room.id
    end
    room
  end
end