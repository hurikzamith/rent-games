class PagesController < ApplicationController
  def profile
    @user = current_user
    @boards = Board.where(user_id: @user.id)
  end
end
