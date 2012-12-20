class EventsController < ApplicationController
    def index
    @event = Event.find(:all, :order=>"id desc") 
    @event_photos = EventPhoto.find_all_by_event_id(@event)
  end
end
