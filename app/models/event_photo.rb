class EventPhoto < ActiveRecord::Base
  attr_accessible :event_id, :tag_name, :photo
  belongs_to :event
  has_attached_file :photo, 
                    :styles => { :thumb => "100x100" },
                    
                    :convert_options => {
                          :thumb => "-background '#F7F4F4' -compose Copy -gravity center -extent 100x100"
                      }
end
