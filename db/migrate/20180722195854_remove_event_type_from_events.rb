class RemoveEventTypeFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :event_type_id, :integer
  end
end
