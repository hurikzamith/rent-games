class PagesController < ApplicationController
  def profile
    @user = current_user
    @board = Board.where(user_id: @user.id)
    # @board = Board.find(params[:board_id])
    # @rent = Rent.find(params[:rent_id])
    # @rents = @board.user.id
    # @rents = Rent.where(user_id: @user.id, board_id: @board.id)
  end
end
