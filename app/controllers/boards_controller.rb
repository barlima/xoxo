class BoardsController < ApplicationController

  def update
    @board = Board.find(params[:id])
    @board.update_field(params[:field], params[:player])
    @board.save
    render json: {win: @board.check_win, full: @board.full?}
  end
end
