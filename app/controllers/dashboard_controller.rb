class DashboardController < ApplicationController
  before_action :set_team

  def show
    @game = @team&.game

    redirect_to root_path unless @team
  end

  def teams
    teams = @team.game.teams
    teams = teams.by_current_heart_rate if params[:by] == 'current_heart_rate'
    teams = teams.by_average_heart_rate if params[:by] == 'average_heart_rate'

    render partial: 'teams', locals: { teams: teams }
  end

  private

  def set_team
    @team = Team.find_by(code: params[:code])
  end
end
