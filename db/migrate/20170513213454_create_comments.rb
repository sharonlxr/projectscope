class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :project_grading, index: true, foreign_key: true
      t.text :content
      t.text :params
      t.string :type
      t.timestamp :created_at

      t.timestamps null: false
    end
  end
end
