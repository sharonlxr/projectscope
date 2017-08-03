class CreateRubrics < ActiveRecord::Migration
  def change
    create_table :rubrics do |t|
      t.integer :iteration
      t.string :metric_name
      t.text :params

      t.timestamps null: false
    end
  end
end
