class CreateEventUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :event_users do |t|

      t.timestamps
      t.integer :user_id
      t.integer :event_id
      t.integer :member_count, null: false, default: 1
      t.text :application_comment, default: "よろしくお願いします！"
      t.text :cancel_comment
      t.string :applicated_title
      t.text :applipated_comment
      t.integer :status, default: 0

    end
  end
end
