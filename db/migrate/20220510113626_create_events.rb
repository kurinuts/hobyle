class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :genre_id
      t.integer :user_id
      t.string :title
      t.string :day
      t.string :time
      t.text :introduction
      t.integer :limit_number
      t.string :place
      t.integer :fee
      t.string :preparation
      t.string :remarks
      t.string :remarks2
      t.string :question
      t.boolean :is_active
      t.timestamps
    end
  end
end
