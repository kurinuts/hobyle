class CreateSecondgenres < ActiveRecord::Migration[6.1]
  def change
    create_table :secondgenres do |t|
      t.integer :genre_id
      t.string :name, null: false
      t.timestamps
    end
  end
end
