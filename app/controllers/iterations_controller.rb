class IterationsController < ApplicationController

  def index
    puts "current_user:"
    puts current_user.role
    if current_user.is_student? 
      #or current_user.is_admin?
      puts "in student view"
      redirect_to student_iteration_path()
      return
    end
    @iterations = Iteration.order(id: :asc).reverse_order.limit(10)
  end
  
  def create
    #create a new, default Iteration and redirect to the edit page for that iteration
    require "date"
    n = Iteration.create!(:name => "new_iteration", :start => Date.today, :end => Date.today + 7)
    redirect_to edit_iteration_path(n.id)
  end
  def student_show
    puts "student show"
    @iterations = Iteration.order(id: :asc).reverse_order.limit(10)
  end
  
  def edit
  
    @iteration = Iteration.find(params[:id])
    @tasks = Task.where('iteration_id': params[:id])
    # @tasks = Task.joins(:iteration).where('iteration_id': params[:id])
    @tasks.each do|e|
      puts e.title
      puts e.iteration_id
    end
    # @tasks = Task.joins(:iteration).where('iteration_id' ,@iteration.id)


  end
  
  def update
    
    #retreive form submission paramaters from the total paramaters
    iteration_params = params["iteration"]
    to_sub = {} #this is the new array we will pass to Iteration to create a new iteration
    to_sub["name"] = iteration_params["name"]
    #We need to make a single date object from the three string objects that iteration_params contains
    to_sub["start"] = Date.new(iteration_params["start(1i)"].to_i, iteration_params["start(2i)"].to_i, iteration_params["start(3i)"].to_i)
    to_sub["end"] = Date.new(iteration_params["end(1i)"].to_i, iteration_params["end(2i)"].to_i, iteration_params["end(3i)"].to_i)
    @iteration = Iteration.find params[:id]
    @iteration.update_attributes!(to_sub)
    redirect_to iterations_path
  end
  
  def destroy
    Iteration.find(params[:id]).destroy
    redirect_to iterations_path
  end
  
end
