class Admin::EventsController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
    def index
      @events = Event.find(:all, :order => 'id desc')
      
      respond_to do |format|
          format.html
          format.xml { render :xml => @events } 
        end
        
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(params[:event])
      if @event.save
        flash[:notice] = "Event created successfully"
        redirect_to admin_events_path
      else
        render :new
      end
    end
    
    def edit
      @event = Event.find(params[:id])
      respond_to do |format|
          format.html
          format.xml { render :xml => @event } 
        end
    end

    def update
      @event = Event.find(params[:id])
      if @event.update_attributes(params[:event])
        flash[:notice] = "Event updated successfully"
        redirect_to admin_events_path
      else
        render :edit
      end
    end
    

    def destroy
      @event = Event.find(params[:id])
     
      if @event.destroy
        flash[:notice] = "Event deleted successfully"
        redirect_to admin_events_path
      end
      
    end
    
end
