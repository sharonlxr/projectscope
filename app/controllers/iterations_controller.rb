class IterationsController < ApplicationController
  def index
    
  end
  
  def create
    require "date"
    n = Iteration.create!(:name => "new_iteration", :start => Date.new(1997, 1, 3), :end => Date.new(2017,10,17))
    redirect_to edit_iteration_path(n.id)
  end
  
  def new

  end
  
  def edit
    
  end
  
  def update
    redirect_to iterations_path
  end
  
  def destroy
    redirect_to iterations_path
  end
  
end
