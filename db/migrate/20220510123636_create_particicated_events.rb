class CreateParticicatedEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :particicated_events do |t|

      t.timestamps
      t.string :thought
    end
  end
end
