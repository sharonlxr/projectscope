class IterationsController < ApplicationController
  def index
    @iterations = Iteration.order(id: :asc).reverse_order.limit(10)
  end
  
  def create
    require "date"
    n = Iteration.create!(:name => "new_iteration", :start => Date.new(1997, 1, 3), :end => Date.new(2017,10,17))
    redirect_to edit_iteration_path(n.id)
  end
  
  def new

  end
  
  def edit
    @iteration = Iteration.find params[:id]
  end
  
  def update
    iteration_params = params["iteration"]
    to_sub = {}
    to_sub["name"] = iteration_params["name"]
    to_sub["start"] = Date.new(iteration_params["start(1i)"].to_i, iteration_params["start(2i)"].to_i, iteration_params["start(3i)"].to_i)
    to_sub["end"] = Date.new(iteration_params["end(1i)"].to_i, iteration_params["end(2i)"].to_i, iteration_params["end(3i)"].to_i)
    @iteration = Iteration.find params[:id]
    @iteration.update_attributes!(to_sub)
    redirect_to iterations_path
  end
  
  def destroy
    redirect_to iterations_path
  end
  
end
