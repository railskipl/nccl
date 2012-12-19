class Event < ActiveRecord::Base
  attr_accessible :name
  has_many :event_photos
end
