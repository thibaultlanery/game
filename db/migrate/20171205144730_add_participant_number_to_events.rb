class AddParticipantNumberToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :participant_number, :integer
  end
end
