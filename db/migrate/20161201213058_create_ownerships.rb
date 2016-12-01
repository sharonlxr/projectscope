class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|

      t.timestamps null: false
    end
  end
end
