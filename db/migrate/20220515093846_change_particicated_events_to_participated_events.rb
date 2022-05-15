class ChangeParticicatedEventsToParticipatedEvents < ActiveRecord::Migration[6.1]
  def change
  rename_table :particicated_events, :participated_events
  end
end
