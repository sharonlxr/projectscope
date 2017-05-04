class CreateProjectGrades < ActiveRecord::Migration
  def change
    create_table :project_grades do |t|
      t.float :score
      t.string :metric_name
      t.text :comment
      t.text :note
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
