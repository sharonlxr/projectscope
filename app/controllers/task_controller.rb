class TaskController < ApplicationController
    #load the form for new task
    def new
        #get the iteration going to be added to
        @iteration = Iteration.find(params[:iter])
        #get the list of current tasks in the iteration selected
        @all_tasks = Task.where("iteration_id",@iteration.id).uniq.pluck(:title)
        if !@all_tasks
            @all_tasks =[]
        end
    end
    #create new tasks
    def create
        @iteration = Iteration.find(params[:iter])
        @tasks = Task.where("iteration_id",@iteration.id)
        if !@tasks
            @tasks =[]
        end
        parants_param = params[:tasks]
        task_param = params[:task]
        new_task = Task.new
        new_task.title=task_param[:title]
        new_task.description=task_param[:description]
        new_task.save
        #added all the checked tasks to parents
       
        @tasks.each do |p|
            
            if p.title and parants_param[p.title]=="true"
                new_task.add_parent(p)
            end
        end
        ##need to add display message and direct to some page 
        flash[:message]= ""
        redirect_to iterations_path
    end
end
