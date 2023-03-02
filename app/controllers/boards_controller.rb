class BoardsController < ApplicationController
  before_action :set_board, only: [ :show, :edit, :destroy, :update ]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      redirect_to boards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: "#{@board.title} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, status: :see_other
  end

  private

  def board_params
    params.require(:board).permit(:title, :price, :rating, :category, :player_number)
  end

  def set_board
    @board = Board.find(params[:id])
  end

end
