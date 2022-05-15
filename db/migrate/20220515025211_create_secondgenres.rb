class CreateSecondgenres < ActiveRecord::Migration[6.1]
  def change
    create_table :secondgenres do |t|
      t.integer :genre_id
      t.string :secondgenre_name
      t.timestamps
    end
  end
end
