class StudentTaskController < ApplicationController
    #load the form for new task
    #show the tasks for a team for a selected the iteration
    def index
        team = current_user.project
        iter = params[:iter]
        @tasks = StudentTask.where('iteration_id': iter, 'project_id': team.id)
        #to do : display the tasks in the view
    end
    #retrive the form for editing a task(instructor only)
    def edit
        @task = StudentTask.find(params[:id])
        @parents = StudentTask.where('iteration_id': @task.iteration_id, 'project_id': @task.project_id)
        #to do : display the task in the view
    end
    
    #save the change made by an instructor
    def saveChange
        @target_task = StudentTask.find(params[:id])
        #get all the information from the form submitted and save the change to targe task
    end
    
    #change the status of a task from student
    def updateStatus
        
    end
    
    #show the graph for all the teams for instructor
    def showAllForInstuctor
        iter = params[:iter]
        @tasks = StudentTask.where('iteration_id': iter)
        @teams = Project.all
        #to do: display the graph for each team
    end
    
    #show the detailed graph of a team for instructor
    def showATeamForInstructor
        team = params[:team]
        iter = params[:iter]
        @tasks = StudentTask.where('iteration_id': iter, 'project_id': team)
        #todo: diplay the tasks 
    end
end
