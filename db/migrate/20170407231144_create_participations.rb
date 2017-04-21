class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :participation

      t.timestamps
    end
  end
end
