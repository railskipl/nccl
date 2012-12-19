class Admin::EventPhotosController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
    def index
      @event_id = params[:event_id]
      @events_photos = EventPhoto.find_all_by_event_id(@event_id)
      
      respond_to do |format|
          format.html
          format.xml { render :xml => @events_photos } 
        end
        
    end

    def new
      @event_id = params[:event_id]
      @event_photo = EventPhoto.new
    end

    def create
      @event_photo = EventPhoto.new(params[:event_photo])
      if @event_photo.save
        flash[:notice] = "Photo added successfully"
        redirect_to admin_event_event_photos_path(@event_photo.event_id)
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
