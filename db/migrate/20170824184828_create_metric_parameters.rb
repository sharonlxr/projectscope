class CreateMetricParameters < ActiveRecord::Migration
  def change
    create_table :metric_parameters do |t|
      t.string :title
      t.string :metric_name
      t.text :parameters
      t.references :metric_sample, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end