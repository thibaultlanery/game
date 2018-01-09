class AddEventTypesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :event_type, foreign_key: true
  end
end
