class RentsController < ApplicationController
  def new
    if current_user.present?
      @rent = Rent.new
      @board = Board.find(params[:board_id])
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @board = Board.find(params[:board_id])
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.board = @board
    @rent.save
    if @rent.save
      redirect_to board_rent_path(@board, @rent)
      # TODO
      # CONSERTAR ROTA PARA SHOW DE RENTS DO CURRENT USER!
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
  end

  private

  def rent_params
    params.require(:rent).permit(:start_date, :end_date)
  end

end
