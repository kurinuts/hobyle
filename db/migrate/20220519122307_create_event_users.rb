class CreateEventUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :event_users do |t|

      t.timestamps
      t.integer :user_id
      t.integer :event_id
      t.integer :member_count
      t.text :application_comment
      t.text :cancel_comment
      t.string :applicated_title
      t.text :applipated_comment
      t.integer :status

    end
  end
end
