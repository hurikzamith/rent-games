class RentsController < ApplicationController
  def new
    @rent = Rent.new
    @board = Board.find(params[:board_id])
  end

  def create
    @rent = Rent.new(params[:board_id])
    @rent.save!
  end
end
