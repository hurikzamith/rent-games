class RentsController < ApplicationController
  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(params[:board_id])
    @rent.save!
  end

  
end
