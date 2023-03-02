class BoardsController < ApplicationController
  def index
    @boards = Board.all
    raise
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params[:id])
    @board.save
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
  end

  def destroy
  end


end
