class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :genre_id
      t.string :title
      t.string :day
      t.string :time
      t.string :introduction
      t.integer :fee
      t.string :preparation
      t.string :remarks
      
      t.timestamps
    end
  end
end
