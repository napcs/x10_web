class UnitsController < ApplicationController

def index
  @unit = Unit.new
  @units = Unit.all
end

def new
  @unit = Unit.new
end

def create
  @unit = Unit.new(unit_params)
  if @unit.save
    respond_to do |format|
  	  format.html do
  	    flash[:notice] = "Unit created"
  		  redirect_to units_path
  	  end
  	  
	  end

  else
    respond_to do |format|
      format.html{render :action => "new"}
    end
  end
end

def show
  @unit = Unit.find(params[:id])
end

def edit
  @unit = Unit.find(params[:id])
end

def update
  @unit = Unit.find(params[:id])
  if @unit.update_attributes(unit_params)
    respond_to do |format|
  	  format.html do
  	    flash[:notice] = "Unit created"
  		  redirect_to @unit
  	  end
    end
  else
    respond_to do |format|
      format.html{render :action => "edit"}	
    end
  end
end

def destroy
  @unit = Unit.find(params[:id])
  @unit.destroy
  respond_to do |format|
    format.html do
      flash[:notice] = "Removed."
      redirect_to units_path
    end
  end
end

def unit_params
  params.require(:unit).permit(:name, :code)
end


end
