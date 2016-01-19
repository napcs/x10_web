class StatusesController < ApplicationController
  def update
    @unit = Unit.find(params[:unit_id])
    case params[:value]
      when "on" then @unit.on
      when "off" then @unit.off
    end

    respond_to do |format|
      format.html do
        if params[:dashboard]
          redirect_to root_path
        else
          redirect_to unit_path(@unit)
        end
      end
    end
  end

end
