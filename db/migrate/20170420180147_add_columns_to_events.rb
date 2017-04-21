class AddColumnsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :happen_at, :date
    add_column :events, :due_at, :date
    add_column :events, :canceled_at, :date
  end
end
