class Committee < ActiveRecord::Base
  attr_accessible :description, :designation, :education, :name, :photo, :committee_type_id
  
  has_friendly_id :name, :use_slug => true
  
  has_attached_file :photo, 
                    :styles => { :thumb => "100x100" },
                    
                    :convert_options => {
                          :thumb => "-background '#F7F4F4' -compose Copy -gravity center -extent 100x100"
                      }
  
  
end
