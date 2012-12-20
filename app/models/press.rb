class Press < ActiveRecord::Base
   attr_accessible :title,:photo
     has_attached_file :photo, 
                    :styles => { :thumb => "100x100",:medium => "450x450" },
                    
                    :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "press_release/:id/:style/:basename.:extension",
                    
                    :convert_options => {
                          :thumb => "-background '#F7F4F4' -compose Copy -gravity center -extent 100x100",
                          :medium => "-background '#F7F4F4' -compose Copy -gravity center -extent 450x450" 
                      }
end
