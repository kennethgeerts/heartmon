class DashboardController < ApplicationController
  def show
    @team = Team.find_by(code: params[:code])
  end
end
