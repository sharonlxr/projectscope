class CreateProjectGradings < ActiveRecord::Migration
  def change
    create_table :project_gradings do |t|
      t.references :project, index: true, foreign_key: true
      t.string :metric_name
      t.float :grade
      t.timestamp :created_at

      t.timestamps null: false
    end
  end
end
