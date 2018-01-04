class ChangeColumnsToEvent < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :happen_at, :datetime
  end
end
