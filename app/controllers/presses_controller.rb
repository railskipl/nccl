class PressesController < ApplicationController
  def index
     @presses = Press.find(:all) 
  end
end
