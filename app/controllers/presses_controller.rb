class PressesController < ApplicationController
  def index
     @presses = Press.find(:all, :order=>"id desc") 
  end
end
