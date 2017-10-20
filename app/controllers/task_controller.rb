class TaskController < ApplicationController
    #load the form for new task
    def new
        #get the iteration going to be added to
        @iteration = Iteration.find(params[:iter])
        #get the list of current tasks in the iteration selected
        @all_tasks =  Task.where('iteration_id': params[:iter]).uniq.pluck(:title)
        if !@all_tasks
            @all_tasks =[]
        end
    end
    #create new tasks
    def create
        @iteration = Iteration.find(params[:iter])
        @tasks = Task.where('iteration_id': params[:iter])
        if !@tasks
            @tasks =[]
        end
        parants_param = params[:tasks]
        task_param = params[:task]
        if task_param[:title].nil?or task_param[:description].nil? or task_param[:title].empty? or task_param[:description].empty?
            flash[:message]="Please fill in all required fields"
            puts("redirect because empty")
            redirect_to new_task_view_path(params[:iter])
            return
        end
        new_task = Task.new
        new_task.title=task_param[:title]
        new_task.description=task_param[:description]
        new_task.iteration = @iteration
        new_task.save
        #added all the checked tasks to parents
       
        @tasks.each do |p|
            if !p.title.nil? 
                if !parants_param.nil? and parants_param[p.title]=="true"
                    new_task.add_parent(p)
                end
            end
        end
        ##need to add display message and direct to some page 
        flash[:message]= "Successfully created task"
        puts(edit_iteration_path(params[:iter]))
        redirect_to edit_iteration_path(params[:iter])
    end
    #edit an existing task
    def edit
        @task = Task.find(params[:id])
    end
end
