class RemoveColumnFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :game, :string
  end
end
