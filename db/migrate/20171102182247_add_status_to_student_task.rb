class AddStatusToStudentTask < ActiveRecord::Migration
  def change
    add_column :student_tasks, :status, :String,  default:"In Screen"
  end
end
