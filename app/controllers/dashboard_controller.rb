class DashboardController < ApplicationController
  def show
    @team = Team.find_by(code: params[:code])
    @game = @team&.game

    redirect_to root_path unless @team
  end
end
