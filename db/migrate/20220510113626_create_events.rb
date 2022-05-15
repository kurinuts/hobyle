class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :genre_id
      t.integer :secondgenre_id
      t.integer :user_id
      t.string :title
      t.datetime :daytime
      t.integer :all_time
      t.text :introduction
      t.integer :limit_number
      t.string :place
      t.integer :fee
      t.string :preparation
      t.string :remarks
      t.string :second_remarks
      t.string :question
      t.boolean :is_active
      t.timestamps
    end
  end
end
