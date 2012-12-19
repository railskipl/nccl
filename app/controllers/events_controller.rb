class EventsController < ApplicationController
    def index
    @event = Event.find(:all) 
    @event_photos = EventPhoto.find_all_by_event_id(@event)
  end
end
