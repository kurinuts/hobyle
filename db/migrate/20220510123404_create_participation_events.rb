class CreateParticipationEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :participation_events do |t|

      t.timestamps
      t.string :comment
      t.boolean :is_active
      
    end
  end
end
