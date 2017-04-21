class RemoveColumnFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :happen_at, :datetime
    remove_column :events, :due_at, :datetime
    remove_column :events, :canceled_at, :datetime
  end
end
