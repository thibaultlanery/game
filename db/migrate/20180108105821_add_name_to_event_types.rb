class AddNameToEventTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :event_types, :name, :string
  end
end
