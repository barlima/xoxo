class BoardsController < ApplicationController

  def update
    @board = Board.find(params[:id])
    head :ok
  end

end
