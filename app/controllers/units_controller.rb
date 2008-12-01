class UnitsController < ApplicationController

def index
  @unit = Unit.new
  @units = Unit.all
end

def new
  @unit = Unit.new
end

def create
  @unit = Unit.new(params[:unit])
  if @unit.save
    respond_to do |format|
  	  format.html do
  	    flash[:notice] = "Unit created"
  		  redirect_to units_path
  	  end
  	  format.js
	  end

  else
    respond_to do |format|
       format.html{render :action => "new"}
	   format.js do
	     render :update do |page|
   	        page.alert("There was an error")
		 end
	   end
       format.xml{render :xml, @unit.errors.to_xml}
	end	
  end
end

def show
  @unit = Unit.find(params[:id])
  respond_to do |format|
   format.html
   format.iphone{render :layout => false }
  end
end

def edit
  @unit = Unit.find(params[:id])
  respond_to do |format|
   format.html
   format.iphone{render :layout => false }
  end
end

def update
  @unit = Unit.find(params[:id])
  if @unit.update_attributes(params[:unit])
    respond_to do |format|
  	  format.html do
  	  flash[:notice] = "Unit created"
  		 redirect_to units_path
  	  end
  	  format.js
      format.iphone do
        render :update do |page|
           page << "window.location = '#{units_path}';"
         end
      end
  	  format.xml do
  	    render :xml => @unit.to_xml
  	  end
	
    end
  else
    respond_to do |format|
       format.html{render :action => "new"}
       format.iphone{render :action => "show", :layout => false }
       
	   format.js do
	     render :update do |page|
   	        page.alert("There was an error")
		 end
	   end
       format.xml{render :xml, @unit.errors.to_xml}
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
    format.js
  end
end

end
