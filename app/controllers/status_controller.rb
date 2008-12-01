class StatusController < ApplicationController
  def update
    @unit = Unit.find(params[:unit_id])
  	case params[:value]
  	  when "on" then @unit.on
  	  when "off" then @unit.off
  	end
  	
  	puts @unit.id
	  respond_to do |format|
	    format.html{redirect_to unit_path(@unit)}
      format.iphone{render :text => "Done", :layout => false }
	  end
  end

end
