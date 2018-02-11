class CreateEventTypePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :event_type_preferences do |t|
      t.references :event_type, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
