class DashboardController < ApplicationController
  def show
    @units = Unit.all.order(:position)
  end
end
