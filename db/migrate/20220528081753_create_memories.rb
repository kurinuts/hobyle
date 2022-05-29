class CreateMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :memories do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :event_user_id
      t.string :title
      t.text :comment
      t.timestamps
    end
  end
end
