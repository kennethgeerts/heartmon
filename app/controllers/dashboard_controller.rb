class DashboardController < ApplicationController
  before_action :set_team
  before_action :set_game

  def show
    redirect_to root_path unless @team
  end

  def teams
    params[:by] ||= 'current_heart_rate'

    @teams = @game.teams
    @teams = @teams.by_current_heart_rate if params[:by] == 'current_heart_rate'
    @teams = @teams.by_average_heart_rate if params[:by] == 'average_heart_rate'
  end

  def countdown
  end

  private

  def set_team
    @team = Team.find_by(code: params[:code])
  end

  def set_game
    @game = @team&.game
  end
end
