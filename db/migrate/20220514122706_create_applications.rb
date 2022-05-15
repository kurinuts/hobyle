class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|

      t.timestamps
      t.integer :events_id
      t.integer :genres_id
      t.integer :number
      t.text :application_comment
      t.text :cancel_comment
    end
  end
end
