class DashboardController < ApplicationController
  def show
    @team = Team.find_by(code: params[:code])
    @game = @team&.game

    redirect_to root_path unless @team
  end

  def teams
    teams = Team.find_by(code: params[:code]).game.teams

    teams = teams.by_current_heart_rate if params[:by] == 'current_heart_rate'
    teams = teams.by_average_heart_rate if params[:by] == 'average_heart_rate'

    render partial: 'teams', locals: { teams: teams }
  end
end
