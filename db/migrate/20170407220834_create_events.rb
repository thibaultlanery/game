class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.datetime :happen_at
      t.datetime :canceled_at
      t.datetime :due_at
      t.string :address
      t.string :game

      t.timestamps
    end
  end
end
