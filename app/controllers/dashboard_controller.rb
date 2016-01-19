class DashboardController < ApplicationController
  def show
    @units = Unit.all
  end
end
