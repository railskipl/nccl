class Press < ActiveRecord::Base
   attr_accessible :title,:photo
     has_attached_file :photo, 
                    :styles => { :thumb => "100x100",:medium => "350x350" },
                    
                    :convert_options => {
                          :thumb => "-background '#F7F4F4' -compose Copy -gravity center -extent 100x100",
                          :medium => "-background '#F7F4F4' -compose Copy -gravity center -extent 350x350" 
                      }
end
