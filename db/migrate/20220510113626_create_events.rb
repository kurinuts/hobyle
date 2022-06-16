class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :genre_id
      t.integer :user_id
      t.integer :secondgenre_id
      t.string :title, null: false
      t.datetime :daytime, null: false
      t.integer :all_time, null: false
      t.text :introduction, null: false
      t.integer :limit_number, null: false
      t.string :place, null: false
      t.integer :fee, null: false
      t.string :preparation, null: false
      t.string :remarks
      t.string :second_remarks
      t.string :question
      t.boolean :is_active
      t.timestamps
    end
  end
end
