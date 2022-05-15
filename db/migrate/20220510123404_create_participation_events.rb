class CreateParticipationEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :participation_events do |t|

      t.timestamps
      t.string :participation_comment_title
      t.text :participation_comment
      
    end
  end
end
