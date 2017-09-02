class AddStateToMetricParameters < ActiveRecord::Migration
  def change
    add_column :metric_parameters, :state, :integer, default: 0
  end
end
